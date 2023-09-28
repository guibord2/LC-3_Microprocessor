module datapath( input logic LD_PC, Reset, LD_IR, LD_REG, ADDR1MUX, SR2MUX, SR1MUX, LD_CC, LD_BEN, DR, LD_LED,
					  input logic[15:0] BUS,
					  input logic[1:0] PCMUX, ALUK, ADDR2MUX,
					  input logic Clk,
					  output logic[15:0] PC_Val, IR_Val, ALU_Out, ADDR_OUT,
					  output logic BEN,
					  output logic [9:0] LED
					);
			

logic[15:0] Out_PC_Mux, SR1_OUT, SR2_OUT;
logic[2:0]  DRMUX_Out, SR1MUX_Out;
logic[15:0] IRSext10, IRSext8, IRSext5, IRSext4;
logic[15:0] MuxtoADDR_1, MuxtoADDR_2, SR2MUX_OUT;
logic N_in, Z_in, P_in, BEN_in, N_val, Z_val, P_val;


//PC Mux
mux_4to1   PCMUX0(.S(PCMUX),
					  .through_00(PC_Val + 1'b1),
					  .through_01(ADDR_OUT), 
					  .through_10(ADDR_OUT), 
					  .through_11(BUS), 
					  .Q_Out(Out_PC_Mux) );
	
//PC Register	
reg_16     PC(.Clk(Clk),
				  .Load(LD_PC),
				  .Reset(Reset),
				  .D(Out_PC_Mux), 
				  .Data_Out(PC_Val));
	
//IR Register	
reg_16		  IR(.Clk(Clk),
				  .Load(LD_IR),
				  .Reset(Reset),
				  .D(BUS), 
				  .Data_Out(IR_Val));
				  
reg_10		  LED0(.Clk(Clk),
						.Load(LD_LED),
						.Reset(Reset),
						.D(IR_Val[9:0]),
						.Data_Out(LED));
				  
//DRMUX     What Exactly is DR? What should be 1Out and 0Out??  DR is not defined
mux_2to1 #(3) DRMUX(.S(DR), .through_1(IR_Val[11:9]), .through_0(3'b111), .Q_Out(DRMUX_Out));

//SR1 = 0 if ADD or AND or NOT  // SR1 = 1 if ST, STI, or STR 
mux_2to1 #(3) SR1MUX0(.S(SR1MUX), .through_1(IR_Val[11:9]), .through_0(IR_Val[8:6]), .Q_Out(SR1MUX_Out));
				  

//Register File
reg_file	  register_file(.D(BUS), 
								 .DRMUX(DRMUX_Out),
								 .SR2(IR_Val[2:0]), 
								 .SR1_MUX(SR1MUX_Out),
								 .LD_REG(LD_REG), 
								 .Clk(Clk), 
								 .Reset(Reset),
								 .SR2_OUT(SR2_OUT),
								 .SR1_OUT(SR1_OUT));
								 
								 
//Sign Extend IR Values
sext4  IRSEXT4(.IR_Val(IR_Val[4:0] ), .sext_val(IRSext4) );
sext5  IRSEXT5(.IR_Val(IR_Val[5:0] ), .sext_val(IRSext5) );
sext8  IRSEXT8(.IR_Val(IR_Val[8:0] ), .sext_val(IRSext8) );
sext10 IRSEXT10(.IR_Val(IR_Val[10:0]), .sext_val(IRSext10));

//ADDR2MUX (value is 0->3 left to right)
mux_4to1    ADDR2MUX_mux(.S(ADDR2MUX), 
								 .through_00(IRSext10), 
								 .through_01(IRSext8), 
								 .through_10(IRSext5),
								 .through_11(16'h0), 
								 .Q_Out(MuxtoADDR_2));
					
//ADDR1MUX //ADDR1MUX = 1  sends PC_val   //ADDR1MUX = 0 sends SR1_OUT				
mux_2to1    ADDR1MUX_mux(.S(ADDR1MUX), .through_1(PC_Val), .through_0(SR1_OUT), .Q_Out(MuxtoADDR_1));

								 
//Adder
assign ADDR_OUT = MuxtoADDR_1 + MuxtoADDR_2;


//SR2MUX		0->Sext4, 1->SR2_OUT 
mux_2to1     SR2MUX_mux(.S(SR2MUX), .through_1(IRSext4), .through_0(SR2_OUT), .Q_Out(SR2MUX_OUT));



//ALU   00->ADD, 01->AND, 10->~A, 11->~B
ALU		ALU_mod(.S(ALUK), .A(SR1_OUT), .B(SR2MUX_OUT), .Q_Out(ALU_Out));


//NZP Logic Block
always_comb begin
	Z_in = 0;
	N_in = 0;
	P_in = 0;
	//should this be case logic? I don't think so but is good question
	if (BUS == 16'h0000)
		Z_in = 1;
	else if(BUS[15] == 1'b1)
		N_in = 1;
	else if(BUS[15] == 1'b0)
		P_in = 1;
end

reg_1     N(.Clk(Clk),
				.Load(LD_CC),
				.Reset(Reset),
				.D(N_in), 
				.Data_Out(N_val));

reg_1     Z(.Clk(Clk),
				.Load(LD_CC),
				.Reset(Reset),
				.D(Z_in), 
				.Data_Out(Z_val));

reg_1     P(.Clk(Clk),
				.Load(LD_CC),
				.Reset(Reset),
				.D(P_in), 
				.Data_Out(P_val));

assign BEN_in = (IR_Val[11]&N_val) | (IR_Val[10]&Z_val) | (IR_Val[9]&P_val);

reg_1     BEN_reg(.Clk(Clk),
						.Load(LD_BEN),
						.Reset(Reset),
						.D(BEN_in), 
						.Data_Out(BEN));




			
endmodule 