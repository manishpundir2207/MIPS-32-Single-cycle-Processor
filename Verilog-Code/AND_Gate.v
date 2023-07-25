module And_Gate(
    input a,
    input b,
    output reg y
    );

always @ (*)
begin
	 y= a&b;
end
endmodule

