//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: P.Tarun
// 
// Create Date: 11/10/2023 11:19:06 AM
// Design Name: 
// Module Name: PC
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


module PC #(parameter PC_WIDTH = 32)
(
input                          CLK ,RST,
input      [PC_WIDTH - 1 : 0]   PC_reg ,
output reg [PC_WIDTH - 1 : 0]   PC 
);

always @( posedge CLK or negedge RST )
begin
if (!RST)
  PC <= 32'b0 ;
else 
  PC <= PC_reg ;
end

endmodule
