module Instruction_Memory(PC_Read_address, Instruction_Out);
input [31:0] PC_Read_address; 
output reg [31:0] Instruction_Out; 
reg [7:0] Inst_Mem[0:4095]; 
initial
begin
Inst_Mem[0] = 8'h8C;
Inst_Mem[1] = 8'h09;
Inst_Mem[2] = 8'h00;
Inst_Mem[3] = 8'h00;

Inst_Mem[4] = 8'h8c;
Inst_Mem[5] = 8'h0a;
Inst_Mem[6] = 8'h00;
Inst_Mem[7] = 8'h04;

Inst_Mem[8] = 8'h11;
Inst_Mem[9] = 8'h49;
Inst_Mem[10] = 8'h00;
Inst_Mem[11] = 8'h04;

Inst_Mem[12] = 8'h01;
Inst_Mem[13] = 8'h2a;
Inst_Mem[14] = 8'h58;
Inst_Mem[15] = 8'h22;

Inst_Mem[16] = 8'h08;
Inst_Mem[17] = 8'h00;
Inst_Mem[18] = 8'h00;
Inst_Mem[19] = 8'h08;

Inst_Mem[20] = 8'h01;
Inst_Mem[21] = 8'h2a;
Inst_Mem[22] = 8'h70;
Inst_Mem[23] = 8'h20;

Inst_Mem[24] = 8'h01;
Inst_Mem[25] = 8'h2a;
Inst_Mem[26] = 8'h78;
Inst_Mem[27] = 8'h2a;

Inst_Mem[28] = 8'h01;
Inst_Mem[29] = 8'h2a;
Inst_Mem[30] = 8'h58;
Inst_Mem[31] = 8'h20;

Inst_Mem[32] = 8'hac;
Inst_Mem[33] = 8'h0b;
Inst_Mem[34] = 8'h00;
Inst_Mem[35] = 8'h08;
end 
always @(PC_Read_address)
begin
Instruction_Out = {Inst_Mem[PC_Read_address], Inst_Mem[PC_Read_address+32'd1],
Inst_Mem[PC_Read_address+32'd2], Inst_Mem[PC_Read_address+32'd3]};
end
endmodule