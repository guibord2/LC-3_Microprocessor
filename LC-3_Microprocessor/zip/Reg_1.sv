module reg_1 (input  logic Clk, Reset, Load,
              input  logic D,
              output logic Data_Out);

    always_ff @ (posedge Clk)
    begin
	 	 if (Reset) //notice, this is a sycnrhonous reset, which is recommended on the FPGA
			  Data_Out <= 1'h0;
		 else if (Load)
			  Data_Out <= D;
    end

endmodule