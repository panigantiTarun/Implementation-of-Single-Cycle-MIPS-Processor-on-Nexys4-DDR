//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: P.Tarun
// 
// Create Date: 12/26/2023 12:54:56 PM
// Design Name: 
// Module Name: slow_clk_refresh
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


module slow_clk_refresh(CLK,clk_out2);
input CLK;
output reg clk_out2;
integer count=0;
initial begin
clk_out2=0;end
always@(posedge CLK)
begin
    if(count==25000000-1)
        begin
        clk_out2 <= ~clk_out2;
        count<=0;
        end
    else
        begin
        count<=count+1;
        //clk_out<=clk_out;
        end
end
endmodule
