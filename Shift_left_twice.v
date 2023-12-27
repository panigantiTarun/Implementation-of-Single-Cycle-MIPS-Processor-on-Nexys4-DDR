`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2023 11:20:42 AM
// Design Name: 
// Module Name: Shift_left_twice
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


module Shift_left_twice #(parameter Shift_WIDTH = 32)
(
input   [Shift_WIDTH - 1 : 0]  Shift_IN ,
output  [Shift_WIDTH - 1 : 0]  Shift_OUT
);

assign Shift_OUT = Shift_IN << 2 ;

endmodule
