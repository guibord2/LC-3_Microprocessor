//module sext
//			#(parameter width = 5)
//			(input logic [width-1:0] IR_Val,
//			 output logic[15:0] sext_val);
//			 logic [15 - width:0] n = {width{1'b1}};
//			 
//			 assign sext_val = {n,IR_Val};
//			 
//endmodule 




module sext4(input logic [4:0] IR_Val,
				output logic [15:0] sext_val);
				always_comb
					if(IR_Val[4] == 1'b1)
						begin
							sext_val = {11'b11111111111, IR_Val};
						end
					else
						begin
							sext_val = {11'b0, IR_Val};
						end
				
					
endmodule

module sext5(input logic [5:0] IR_Val,
				output logic [15:0] sext_val);
				always_comb
					if(IR_Val[5] == 1'b1)
						begin
							sext_val = {10'b1111111111, IR_Val};
						end
					else
						begin
							sext_val = {10'b0, IR_Val};
						end
endmodule

module sext8(input logic [8:0] IR_Val,
				output logic [15:0] sext_val);
				always_comb
					if(IR_Val[8] == 1'b1)
						begin
							sext_val = {7'b1111111, IR_Val};
						end
					else
						begin
							sext_val = {7'b0, IR_Val};
						end
endmodule

module sext10(input logic [10:0] IR_Val,
				output logic [15:0] sext_val);
				always_comb
					if(IR_Val[10] == 1'b1)
						begin
							sext_val = {5'b11111, IR_Val};
						end
					else
						begin
							sext_val = {5'b0, IR_Val};
						end
endmodule
