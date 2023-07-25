module PC_Adder(Current_Ins,Next_Ins);
input[31:0]Current_Ins;
output[31:0]Next_Ins; 
assign Next_Ins=Current_Ins+32'd4; 
endmodule
