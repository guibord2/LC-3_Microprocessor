module mux_2to1  
						#(parameter width = 16)
						(input					S,
						input					[width-1:0] through_1,
						input 				[width-1:0] through_0,
						output logic		[width-1:0] Q_Out);
						
		
		//s: first bit is CALBR, second is shift signal
		// 17 bit parallel multiplexer implemented using case statement
		always_comb
		begin
				unique case(S)
						1'b1	:	Q_Out = through_1;
						1'b0  :  Q_Out = through_0;
						default:	;
				endcase
		end
		
		
endmodule