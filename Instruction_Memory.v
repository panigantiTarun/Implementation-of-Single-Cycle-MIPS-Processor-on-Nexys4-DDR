//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: P.Tarun
// 
// Create Date: 11/10/2023 11:17:04 AM
// Design Name: 
// Module Name: Instruction_Memory
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

module Instruction_Memory #(parameter InsMemory_WIDTH = 32 , InsMemory_DEPTH = 256 )
(
input      [InsMemory_WIDTH - 1 : 0]  PC ,
output reg [InsMemory_WIDTH - 1 : 0]  RD 
);

reg [InsMemory_WIDTH - 1 : 0] Ins_mem [0 : InsMemory_DEPTH - 1  ] ;

 /********************************FIND GCD FOR 120 and 180********************************/
/*	initial
 begin
  Ins_mem [0] = 32'h00008020;      // add $s0, $zero, $zero  
  Ins_mem [1] = 32'h20100082;      // addi $s0, $zero, 120(78) 0r 130(82)
  Ins_mem [2] = 32'h00008820;      // add $s1, $zero, $zero 
  Ins_mem [3] = 32'h201100BE;      // addi $s1, $zero, 180(B4) or 190(BE) 
  Ins_mem [4] = 32'h00009020;      // add $s2, $zero, $zero 
  Ins_mem [5] = 32'h12110006;      // add $s2, $s1, $s1 
  Ins_mem [6] = 32'h0211482A;      // sub $s0, $s2, $s1 
  Ins_mem [7] = 32'h11200002;      // sw $s0, 2($zero) 
  Ins_mem [8] = 32'h02308822;      // sub $s2, $s1, $s0 
  Ins_mem [9] = 32'h08000005;      // beq $zero, $s0, 5 
  Ins_mem [10] = 32'h02118022;     // sub $s0, $s1, $s0 
  Ins_mem [11] = 32'h08000005;     // beq $zero, $s0, 5 
  Ins_mem [12] = 32'h00109020;     // sw $s2, 16($s0) 
  Ins_mem [13] = 32'hAC120000;     // lw $s2, 0($s0) 

  end  */
				 
 /********************************FIND FACTORIAL OF NUMBER 7********************************/
   initial
	begin
		Ins_mem [0]  = 32'h00008020;    //add $s0, $0, $0
		Ins_mem [1]  = 32'h20100007;    //addi $s0, $0, 7
		Ins_mem [2]  = 32'h00008820;    //add $s1, $0, $0
		Ins_mem [3]  = 32'h20110001;    //addi $s1, $0, 1
		Ins_mem [4]  = 32'h12000003;    //beq $s1, $0, 3
		Ins_mem [5]  = 32'h0230881C;    //mul $s1, $s1, $s0
		Ins_mem [6]  = 32'h2210FFFF;    //addi $s0, $s0, -1
		Ins_mem [7]  = 32'h08000004;    //J  4
		Ins_mem [8]  = 32'hAC110000;    //sw $s1, 0($0)
 	end 
  
  
    always @(*) begin
    if (PC>=32'h000020)
        RD =   32'hAC110000 ;
    else 
        RD = Ins_mem [PC>>2];
    end
 //each instruction is typically stored in a 4-byte (32-bit) address.
 //the PC value is divided by 4 (PC>>2) to obtain the index in the Ins_mem array.
 //The calculated index is then used to assign the corresponding instruction to the instr output.
 
endmodule
