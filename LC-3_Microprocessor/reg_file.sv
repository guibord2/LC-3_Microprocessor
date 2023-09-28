module reg_file(input logic [15:0] D,
					 input logic [2:0] DRMUX, SR2, SR1_MUX,
					 input logic LD_REG, Clk, Reset,
					 output logic [15:0] SR2_OUT, SR1_OUT);
					 
			
logic [15:0] reg0_Out, reg1_Out, reg2_Out, reg3_Out, reg4_Out, reg5_Out, reg6_Out, reg7_Out;
logic [7:0] Ld_signals;


reg_16		reg0(.Clk(Clk), .Reset(Reset), .Load(Ld_signals[0]), .D(D), .Data_Out(reg0_Out) );
reg_16		reg1(.Clk(Clk), .Reset(Reset), .Load(Ld_signals[1]), .D(D), .Data_Out(reg1_Out) );
reg_16		reg2(.Clk(Clk), .Reset(Reset), .Load(Ld_signals[2]), .D(D), .Data_Out(reg2_Out) );
reg_16		reg3(.Clk(Clk), .Reset(Reset), .Load(Ld_signals[3]), .D(D), .Data_Out(reg3_Out) );
reg_16		reg4(.Clk(Clk), .Reset(Reset), .Load(Ld_signals[4]), .D(D), .Data_Out(reg4_Out) );
reg_16		reg5(.Clk(Clk), .Reset(Reset), .Load(Ld_signals[5]), .D(D), .Data_Out(reg5_Out) );
reg_16		reg6(.Clk(Clk), .Reset(Reset), .Load(Ld_signals[6]), .D(D), .Data_Out(reg6_Out) );
reg_16		reg7(.Clk(Clk), .Reset(Reset), .Load(Ld_signals[7]), .D(D), .Data_Out(reg7_Out) );

decoder_3to8   DR_decoder(.S(DRMUX), .LD_REG(LD_REG), .Ld_signals(Ld_signals));

mux_8to1			SR1_OUT_MUX(.S(SR1_MUX),
									.through_000(reg0_Out), 
									.through_001(reg1_Out), 
									.through_010(reg2_Out), 
									.through_011(reg3_Out),
									.through_100(reg4_Out),
									.through_101(reg5_Out), 
									.through_110(reg6_Out),
									.through_111(reg7_Out),
									.Q_Out(SR1_OUT) );
									
mux_8to1			SR2_OUT_MUX(.S(SR2),
									.through_000(reg0_Out), 
									.through_001(reg1_Out), 
									.through_010(reg2_Out), 
									.through_011(reg3_Out),
									.through_100(reg4_Out),
									.through_101(reg5_Out), 
									.through_110(reg6_Out),
									.through_111(reg7_Out),
									.Q_Out(SR2_OUT) );

					 
					 
					 
endmodule 
