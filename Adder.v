`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2023 11:13:27 AM
// Design Name: 
// Module Name: Adder
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


module Adder #(parameter ADDER_WIDTH = 32)
(
input  [ADDER_WIDTH - 1 : 0] IN_1 , IN_2 ,
output [ADDER_WIDTH - 1 : 0] OUT  
);
assign OUT = IN_1 + IN_2 ;

endmodule