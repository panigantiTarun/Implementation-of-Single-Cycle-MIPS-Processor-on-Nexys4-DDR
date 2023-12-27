//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: P.Tarun
// 
// Create Date: 12/18/2023 11:20:48 PM
// Design Name: 
// Module Name: clkdiv
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


module clk_m(clk_in,clk_out);
input clk_in;
output reg clk_out;
integer count=0;
initial begin
clk_out=0;end
always@(posedge clk_in)
begin
    if(count==1)
        begin
        
        clk_out <= ~clk_out;
        count<=0;
        end
    else
        begin
        count<=count+1;
        //clk_out<=clk_out;
        end
end
endmodule
