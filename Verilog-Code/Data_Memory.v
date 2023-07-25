module Data_Memory(Address,Write_data,Read_data,Mem_Write,Mem_Read,clk);
input[31:0]Address,Write_data; 
input Mem_Write,Mem_Read;
input clk;
output reg [31:0] Read_data; 
reg[7:0] Data_Memory[0:4095]; 
initial 
begin 
Data_Memory[0] = 8'h00;
Data_Memory[1] = 8'h00;
Data_Memory[2] = 8'h00;
Data_Memory[3] = 8'h06;
Data_Memory[4] = 8'h00;
Data_Memory[5] = 8'h00;
Data_Memory[6] = 8'h00;
Data_Memory[7] = 8'h05;
Data_Memory[8] = 8'h8f;
Data_Memory[9] = 8'h09;
Data_Memory[10] = 8'h00;
Data_Memory[11] = 8'h08;
Data_Memory[12] = 8'haf;
Data_Memory[13] = 8'h08;
Data_Memory[14] = 8'h00;
Data_Memory[15] = 8'h10;
Data_Memory[16] = 8'h10;
Data_Memory[17] = 8'h09;
Data_Memory[18] = 8'h09;
Data_Memory[19] = 8'h03;
Data_Memory[20] = 8'h00;
Data_Memory[21] = 8'h29;
Data_Memory[22] = 8'h49;
Data_Memory[23] = 8'h20;

end
always@(*)
begin 
if(Mem_Write&&~Mem_Read)
begin
Data_Memory[Address]= Write_data[31:24]; 
Data_Memory[Address+32'd1]=Write_data[23:16];
Data_Memory[Address+32'd2]=Write_data[15:8];
Data_Memory[Address+32'd3]=Write_data[7:0];
end
else if(Mem_Read&&~Mem_Write)
begin
Read_data[31:24]=Data_Memory[Address];
Read_data[23:16]=Data_Memory[Address+32'd1];
Read_data[15:8]=Data_Memory[Address+32'd2];        
Read_data[7:0]=Data_Memory[Address+32'd3];
end 
end
endmodule