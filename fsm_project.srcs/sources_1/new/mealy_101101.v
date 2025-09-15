`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2025 21:24:58
// Design Name: 
// Module Name: mealy_101101
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module mealy_101101(ip,clk,rst,det);
input ip,clk,rst;
output reg det;
parameter s0=3'b000, s1=3'b001, s2=3'b010, s3=3'b011, s4=3'b100, s5=3'b101, s6=3'b110;
reg [2:0] pr_s,nx_s;

always @(posedge clk)
if (rst) pr_s<=s0;
else pr_s<=nx_s;

always @(ip,pr_s)
case (pr_s)
s0 : if(ip)
     begin nx_s=s1; det=0;end
     else
     begin nx_s=s0;det=0;end
s1 : if(ip)
     begin nx_s=s1; det=0;end
     else
     begin nx_s=s2;det=0;end
s2 : if(ip)
     begin nx_s=s3; det=0;end
     else
     begin nx_s=s0;det=0;end
s3 : if(ip)
     begin nx_s=s4; det=0;end
     else
     begin nx_s=s2;det=0;end
s4 : if(ip)
     begin nx_s=s1; det=0;end
     else
     begin nx_s=s5;det=0;end
s5 : if(ip)
     begin nx_s=s6; det=1;end
     else
     begin nx_s=s0;det=0;end
s6 : if(ip)
     begin nx_s=s4; det=0;end
     else
     begin nx_s=s2;det=0;end
default : begin nx_s=s0; det=0;end
endcase

endmodule
