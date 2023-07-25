`timescale 1ns / 1ps

module Mux2x1(
    input [4:0] Input0,
    input [4:0] Input1,
    input sel,
    output reg [4:0] out
    );

always @ (*)
begin
	if(sel)
		out= Input1;
	else
		out= Input0;
end
endmodule
