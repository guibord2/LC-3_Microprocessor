module decoder_3to8(input logic [2:0] S,
						  input logic LD_REG,
						  output logic [7:0] Ld_signals );
						  
						  
			
always_comb
		begin
				unique case(S)
						3'b000  :  Ld_signals = {7'b0, LD_REG};
						3'b001  :  Ld_signals = {6'b0, LD_REG, 1'b0};
						3'b010  :  Ld_signals = {5'b0, LD_REG, 2'b0};
						3'b011  :  Ld_signals = {4'b0, LD_REG, 3'b0};
						3'b100  :  Ld_signals = {3'b0, LD_REG, 4'b0};
						3'b101  :  Ld_signals = {2'b0, LD_REG, 5'b0};
						3'b110  :  Ld_signals = {1'b0, LD_REG, 6'b0};
						3'b111  :  Ld_signals = {LD_REG,7'b0};
						default :  ;
				endcase
		end


			
						  
endmodule 