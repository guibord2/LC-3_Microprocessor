module mux_4to1_concatenation  ( input					[3:0]S,
											input					[15:0] through_0001,
																			 through_0010,
																			 through_0100, 
																			 through_1000,
											output logic		[15:0] Q_Out);
						
		
		//s: first bit is CALBR, second is shift signal
		// 17 bit parallel multiplexer implemented using case statement
		always_comb
		begin
				unique case(S)
						4'b0001	:	Q_Out = through_0001;
						4'b0010  :  Q_Out = through_0010;
						4'b0100	:	Q_Out = through_0100;
						4'b1000  :  Q_Out = through_1000;
						default 	: 	Q_Out = 16'bx;
				endcase
		end
		
		
endmodule