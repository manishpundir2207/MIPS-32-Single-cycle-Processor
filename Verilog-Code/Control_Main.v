module Control_Main(
    input [5:0] opcode,
    output reg RegDst,
    output reg Jump,
    output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg ALUop1,ALUop2,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite
);

always @(*) begin
    case (opcode)
        // r type
        6'b000000: begin
            RegDst = 1;
            Jump = 0;
            Branch = 0;
            MemRead = 0;
            MemtoReg = 0;
            ALUop1 = 1'b1;
            ALUop2=1'b0;
            MemWrite = 0;
            ALUSrc = 0;
            RegWrite = 1;
        end
        // beq
        6'b000100: begin
            RegDst = 1'bx;
            Jump = 0;
            Branch = 1;
            MemRead = 0;
            MemtoReg = 1'bx;
            ALUop1 = 1'b0;
            ALUop2=1'b1;
            MemWrite = 0;
            ALUSrc = 0;
            RegWrite = 0;
        end
        // lw
        6'b100011: begin
            RegDst = 0;
            Jump = 0;
            Branch = 0;
            MemRead = 1;
            MemtoReg = 1;
             ALUop1 = 1'b0;
            ALUop2=1'b0;
            MemWrite = 0;
            ALUSrc = 1;
            RegWrite = 1;
        end
        // sw
        6'b101011: begin
            RegDst = 0;
            Jump = 0;
            Branch = 0;
            MemRead = 0;
            MemtoReg = 1'bx;
             ALUop1 = 1'b0;
            ALUop2=1'b0;
            MemWrite = 1;
            ALUSrc = 1;
            RegWrite = 0;
        end
        // jump
        6'b000010: begin
            RegDst = 1'bx;
            Jump = 1;
            Branch = 0;
            MemRead = 0;
            MemtoReg = 1'bx;
             ALUop1 = 1'b0;
            ALUop2=1'b0;
            MemWrite = 0;
            ALUSrc = 0;
            RegWrite = 0;
        end
    endcase
end

endmodule
