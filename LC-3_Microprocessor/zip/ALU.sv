module ALU  	  (input					[1:0]  S,
						input					[15:0] A, B,
						output logic		[15:0] Q_Out);
						
		
		//s: first bit is CALBR, second is shift signal
		// 17 bit parallel multiplexer implemented using case statement	
		
		always_comb
		begin
				unique case(S)
						2'b00	:	Q_Out = A+B;
						2'b01 :  Q_Out = A&B;
						2'b10	:	Q_Out = ~A;
						2'b11 :  Q_Out = A;
						default : ; 
				endcase
		end
		
		
endmodule