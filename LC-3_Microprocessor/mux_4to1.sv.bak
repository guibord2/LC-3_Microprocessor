module mux_4to1  (input					S,
						input					[15:0] through_00,
						input 				[15:0] through_01,
						input					[15:0] through_10,
						input 				[15:0] through_11,
						output logic		[15:0] Q_Out);
						
		
		//s: first bit is CALBR, second is shift signal
		// 17 bit parallel multiplexer implemented using case statement
		always_comb
		begin
				unique case(S)
						2'b00	:	Q_Out = through_00;
						2'b01  :  Q_Out = through_01;
						2'b10	:	Q_Out = through_10;
						2'b11  :  Q_Out = through_11;
				endcase
		end
		
		
endmodule