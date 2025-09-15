`timescale 1ns / 1ps

module moore_101101(ip,clk,rst,det);
input ip,clk,rst;
output reg det;
parameter s0=3'b000, s1=3'b001, s2=3'b010, s3=3'b011, s4=3'b100, s5=3'b101, s6=3'b110;
reg [2:0] pr_s,nx_s;

always @(posedge clk)
begin
if (rst) pr_s<=s0;
else pr_s<=nx_s;
end

always @(ip,pr_s)
begin
case (pr_s)
s0 : if(ip)
     nx_s=s1; 
     else
     nx_s=s0;
s1 : if(ip)
     nx_s=s1;
     else
     nx_s=s2;
s2 : if(ip)
     nx_s=s3; 
     else
     nx_s=s0;
s3 : if(ip)
     nx_s=s4;
     else
     nx_s=s2;
s4 : if(ip)
     nx_s=s1;
     else
     nx_s=s5;
s5 : if(ip)
     nx_s=s6;
     else
     nx_s=s0;
s6 : if(ip)
     nx_s=s4;
     else
     nx_s=s2;
default : nx_s=s0;
endcase
end

always @(pr_s)
begin
case (pr_s)
s0 : det=0;
s1 : det=0;
s2 : det=0;
s3 : det=0;
s4 : det=0;
s5 : det=0;
s6 : det=1;
default : det=0;
endcase
end

endmodule
