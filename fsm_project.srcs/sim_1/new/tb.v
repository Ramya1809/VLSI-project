`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2025 18:54:01
// Design Name: 
// Module Name: tb
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
module tb();
reg ip, clk=0, rst;
wire det;
moore_101101 inst( .ip(ip),.clk(clk),.rst(rst),.det(det));

always #5 clk=~clk;

 reg [15:0] sequence = 16'b1011011101101101;
 integer i;

  initial begin
    $display("Starting simulation...");
    $display("time\tclk\tip\tdet");
  end

  initial begin
    rst = 1;
    ip = 0;
    @(negedge clk); rst = 0;

    for (i = 0; i < 16; i = i + 1) begin
      @(negedge clk);   
      ip = sequence[i];

      @(posedge clk);  
      $display("%4t\t%b\t%b\t%b", $time, clk, ip, det);
    end

    #20;
    $finish;
  end

endmodule
