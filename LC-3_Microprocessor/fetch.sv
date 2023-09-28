module fetch(
				input logic MIO_EN, LD_MDR, Clk, Reset,
				input logic [15:0] Data_to_CPU, BUS,
				output logic [15:0] Data_from_CPU

);

logic [15:0] to_MDR;

mux_2to1  MIO_EN_MUX(.S(MIO_EN),
							.through_1(Data_to_CPU),
							.through_0(BUS),
							.Q_Out(to_MDR));
							
reg_16	 MDR_Reg(.Clk(Clk),
						.Load(LD_MDR),
						.Reset(Reset),
						.D(to_MDR), 
						.Data_Out(Data_from_CPU));
							
							


endmodule