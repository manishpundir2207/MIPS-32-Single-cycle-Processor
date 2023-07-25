module Adder_ALU(
input [31:0] In1,
input [31:0] In2,
output reg [31:0] Result);
always@(*)
begin
Result= In1+In2;
end
endmodule
