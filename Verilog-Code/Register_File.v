module Register_File(clk,Read_Register1,Read_Register2,Write_Register,Write_data,
Read_data1,Read_data2,Reg_write,PC_in,PC_out,Reset);
input[4:0]Read_Register1,Read_Register2,Write_Register;
input[31:0]Write_data,PC_in; 
output[31:0]Read_data1,Read_data2,PC_out; 
input clk,Reg_write,Reset;
reg[31:0]Register_Mem[0:31];
integer i;
initial 
begin
for(i=0;i<32;i=i+1)
begin
Register_Mem[i]<=32'b0;
end
end
assign PC_out = Register_Mem[29];
always@(posedge clk)
begin 
Register_Mem[29]=PC_in;
if(Reg_write) 
begin
Register_Mem[Write_Register]=Write_data;
end
end
assign Read_data1 = Register_Mem[Read_Register1]; 
assign  Read_data2 = Register_Mem[Read_Register2]; 
always@(posedge clk)
begin
if (Reset)
begin 
Register_Mem[29] = 0;
end
end
endmodule
