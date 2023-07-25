

module Shift_Left_2(
    input [31:0] In,
    output reg [31:0] Out
    );

always @(In)
	begin

		 Out= In << 2;

	end
endmodule
