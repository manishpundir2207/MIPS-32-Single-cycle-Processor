module Sign_Extension(input [15:0] In,output reg [31:0] Out);	 
always@(In) 
begin
if (In[15]==1)
begin
Out = {16'hffff , In};
end
else 
begin
Out = {16'h0000, In};
end
end
endmodule
