module Mux2x1_32b(
input [31:0] Input0,
input [31:0] Input1,
input sel,
output reg [31:0] out);
always @ (*)
begin
if(sel)
out= Input1;
else
out= Input0;
end
endmodule
