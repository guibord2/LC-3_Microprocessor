module mux_8to1  (input					[2:0]S,
						input					[15:0] through_000, through_001, through_010, through_011,
														 through_100, through_101, through_110, through_111,
						output logic		[15:0] Q_Out);
						
		
		//s: first bit is CALBR, second is shift signal
		// 17 bit parallel multiplexer implemented using case statement
		always_comb
		begin
				unique case(S)
						3'b000   :	Q_Out = through_000;
						3'b001   :  Q_Out = through_001;
						3'b010	:	Q_Out = through_010;
						3'b011   :  Q_Out = through_011;
						3'b100   :	Q_Out = through_100;
						3'b101   :  Q_Out = through_101;
						3'b110	:	Q_Out = through_110;
						3'b111   :  Q_Out = through_111; 
						default	:	;
				endcase
		end
		
		
endmodule