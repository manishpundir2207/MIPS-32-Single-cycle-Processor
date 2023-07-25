
module Single_Cycle_MIPS(input Clock,Reset

    ); 
    wire [31:0] PC_out_w, Intruction_out_w,pc_adder_Out_w,Sign_ext_out_w,Mux_2_out_w ,Mux_3_out_w,
    Mux_4_out_w,Mux_5_out_w,Read_data_1_w,Read_data_2_w,Concatenation_out_w,Shift_Left_2_out_w,
    ALU_Main_result_out_w,Adder_ALU_out_w,Data_Memory_Read_Data_out_w;
    wire Reg_Dst_w,Reg_write_w,Jump_w,Branch_w,MemRead_w,MemtoReg_w,ALUop1_w,ALUop2_w,MemWrite_w,
    ALUSrc_w,Zero_w,And_out_w;
    wire[4:0] Mux_1_out_w;
    wire [27:0] Shift_Left_2_26b_out_w;
    wire [2:0] ALU_Control_out_w;
    Instruction_Memory i1 (.PC_Read_address(PC_out_w), .Instruction_Out(Intruction_out_w));
    PC_Adder i2 (.Current_Ins(PC_out_w),.Next_Ins(pc_adder_Out_w));
    
    Mux2x1 i3 (.Input0(Intruction_out_w[20:16]),.Input1(Intruction_out_w[15:11]),.sel(Reg_Dst_w)
    ,.out(Mux_1_out_w)); 
    
    Shift_Left_2_26b i4 (.data_in(Intruction_out_w[25:0]),.data_out(Shift_Left_2_26b_out_w));
    
    Sign_Extension i5 (.In(Intruction_out_w[15:0]),.Out(Sign_ext_out_w));
    
    Register_File i6 (.clk(Clock),.Read_Register1(Intruction_out_w[25:21])
    ,.Read_Register2(Intruction_out_w[20:16]),.Write_Register(Mux_1_out_w),.Write_data(Mux_3_out_w)
    ,.Read_data1(Read_data_1_w),.Read_data2(Read_data_2_w),.Reg_write(Reg_write_w),.PC_in(Mux_4_out_w)
    ,.PC_out(PC_out_w),.Reset(Reset));
    
    Control_Main i7(.opcode(Intruction_out_w[31:26]),.RegDst(Reg_Dst_w),.Jump(Jump_w),.Branch(Branch_w)
    ,.MemRead(MemRead_w),.MemtoReg(MemtoReg_w),.ALUop1(ALUop1_w),.ALUop2(ALUop2_w),.MemWrite(MemWrite_w)
    ,.ALUSrc(ALUSrc_w),.RegWrite(Reg_write_w));
    
    Jump_Concatination i8 (.Ins_28b(Shift_Left_2_26b_out_w),.PC_plus4(pc_adder_Out_w[31:28])
    ,.Jump_Address(Concatenation_out_w));
    
    ALU_Control i9 (.ALU_Op1(ALUop1_w),.ALU_Op2(ALUop2_w),.Funct(Intruction_out_w[5:0])
    ,.ALU_Control(ALU_Control_out_w));
    
     Mux2x1_32b i10 (.Input0(Read_data_2_w),.Input1(Sign_ext_out_w),.sel( ALUSrc_w),.out(Mux_2_out_w));
     
     Shift_Left_2 i11 (.In(Sign_ext_out_w),.Out(Shift_Left_2_out_w));
     
     ALU_Main i12 (.R_data1(Read_data_1_w),.R_data2(Mux_2_out_w),.ALU_control(ALU_Control_out_w)
     ,.ALU_Result(ALU_Main_result_out_w),.zero(Zero_w));
     
     And_Gate i13 (.a(Branch_w),.b(Zero_w),.y(And_out_w));
     
     Adder_ALU i14 (.In1(pc_adder_Out_w),.In2(Shift_Left_2_out_w),.Result(Adder_ALU_out_w));
     
     Data_Memory i15 (.Address(ALU_Main_result_out_w),.Write_data(Read_data_2_w)
     ,.Read_data(Data_Memory_Read_Data_out_w),.Mem_Write(MemWrite_w),.Mem_Read(MemRead_w),.clk(Clock));
     
      Mux2x1_32b i16 (.Input0(ALU_Main_result_out_w),.Input1(Data_Memory_Read_Data_out_w)
      ,.sel(MemtoReg_w),.out(Mux_3_out_w));
      
     Mux2x1_32b i17 (.Input0(pc_adder_Out_w),.Input1(Adder_ALU_out_w),.sel( And_out_w),.out(Mux_5_out_w));
     
      Mux2x1_32b i18 (.Input0(Mux_5_out_w),.Input1(Concatenation_out_w),.sel( Jump_w),.out(Mux_4_out_w));
endmodule
