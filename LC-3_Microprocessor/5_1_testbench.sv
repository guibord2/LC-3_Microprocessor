module testbench();

timeunit 10ns;

timeprecision 1ns;

logic Clk = 0;
logic Continue;
logic Run; 
logic Reset;
logic [9:0]	SW;


logic [15:0] IR, PC, BUS, MAR, MDR, R0, R1, R2, R3, R4, R5, R6, R7;
logic [6:0]	HEX0;
logic [6:0]	HEX1;
logic [6:0]	HEX2;
logic [6:0]	HEX3;
logic [6:0]	HEX4;
logic [6:0]	HEX5;

logic [9:0]	LED;

always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin : CLOCK_INITIALIZATION
	Clk = 0;
end

slc3_testtop tp(.*);

always begin
#1
assign IR = tp.slc.d0.IR_Val;
assign PC = tp.slc.d0.PC_Val;
assign MAR = tp.slc.MAR_Reg.Data_Out;
assign MDR = tp.slc.MDR;
assign BUS = tp.slc.BUS;
assign R0 = tp.slc.d0.register_file.reg0.Data_Out;
assign R1 = tp.slc.d0.register_file.reg1.Data_Out;
assign R2 = tp.slc.d0.register_file.reg2.Data_Out;
assign R3 = tp.slc.d0.register_file.reg3.Data_Out;
assign R4 = tp.slc.d0.register_file.reg4.Data_Out;
assign R5 = tp.slc.d0.register_file.reg5.Data_Out;
assign R6 = tp.slc.d0.register_file.reg6.Data_Out;
assign R7 = tp.slc.d0.register_file.reg7.Data_Out;
end



initial begin: TEST_VECTORS

//0 state activation for buttons
Continue = 1;
Run = 1;
SW = 8'h31;

#2 Continue = 0;
	Run = 0;
#2 Continue = 1;
#2 Run = 0;
#2	Run = 1;
#2	Run = 0;
#2	Run = 1;
		 Continue = 1;
// io 1
//	#150	SW = 8'h03;
//	// see if the hex display increment by 1 each time continue is hit
////	#150 Continue = 0;
////	#4		SW = 8'hAB;
////	#10 Continue = 1;
////	#150 Continue = 0;
////	#4		SW = 8'h17;
////	#10 Continue = 1;
////	#150 Continue = 0;
//			SW = 8'h11;
//	#150	SW = 8'hAB;
////	#10 Continue = 1;
//	// reset program


//
	
	#70 Continue = 0;
	#2 SW = 8'h03;		
	#10 Continue = 1;
	
	#70 Continue = 0;
	
	
	#10 Continue =1;
	#70 Continue = 0;
	#2 SW = 16'h0002;

	#10 Continue = 1;
//	#100 Continue = 0;
//	#10 Continue = 1;
//	#100 Continue = 0;
//	#10 Continue = 1;


end

endmodule 