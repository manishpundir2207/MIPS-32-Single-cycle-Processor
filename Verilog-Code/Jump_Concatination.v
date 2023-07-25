module Jump_Concatination(
    input [27:0] Ins_28b,
    input [3:0] PC_plus4,
    output reg [31:0] Jump_Address
    );
always @(*)
begin
Jump_Address= {PC_plus4, Ins_28b};
end
endmodule
