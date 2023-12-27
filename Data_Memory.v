//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2023 11:15:43 AM
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory #(parameter DataMemory_WIDTH = 32 , DataMemory_DEPTH = 256 )
(
input                                       CLK,RST,
input                                        WE ,
input      [ DataMemory_WIDTH - 1 : 0 ]      A ,
input      [ DataMemory_WIDTH - 1 : 0 ]      WD ,
output reg [ DataMemory_WIDTH - 1 : 0 ]      RD 
);

reg [DataMemory_WIDTH - 1 : 0] Data_mem [DataMemory_DEPTH - 1  : 0] ;
integer I ;

 always @(posedge CLK or negedge RST )
 begin
  if(!RST)   
    begin
      for (I = 0 ; I < DataMemory_DEPTH ; I = I +1)
        begin
          Data_mem[I] <= {DataMemory_WIDTH{1'b0}}; 
        end
     end
 else if (WE)
     Data_mem [A] <= WD ;
 end
 
 always @(*)
  begin
   RD = Data_mem [A] ;
 end
endmodule