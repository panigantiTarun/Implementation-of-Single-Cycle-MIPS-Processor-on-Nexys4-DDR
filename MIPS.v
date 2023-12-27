//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: P.Tarun
// 
// Create Date: 11/10/2023 11:25:54 AM
// Design Name: 
// Module Name: MIPS
// Project Name: 
// Target Devices: Nexys4 DDR
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


module MIPS 

#( parameter    MIPS_SIZE = 32 , 
			    ALUControl_WIDTH = 3 	 
)            

(
input  wire                           CLK ,
input  wire                           RST ,
output reg[7:0]AN,
output reg[7:0]Ca
);

// internal connection
 wire                                 Zero_flag ;
 wire                                 MemtoReg ;
 wire                                 PCSrc ;
 wire   [ALUControl_WIDTH - 1 : 0]    ALUControl ;
 wire                                 ALUSrc ;
 wire                                 RegDst ;
 wire                                 RegWrite  ;
 wire                                 Jump ;
 wire                                 MemWrite ;
 wire   [MIPS_SIZE - 1 : 0 ]          ReadData ;
 wire   [MIPS_SIZE - 1 : 0 ]          WriteData ;
 wire   [MIPS_SIZE - 1 : 0]           PC ;
 wire   [MIPS_SIZE - 1 : 0]           instr ;
 wire   [MIPS_SIZE - 1 : 0]           ALUOut ;
 wire clk_out;
 wire clk_out2;
Data_Path DP (
.CLK(clk_out2) ,
.RST(RST) ,
.ReadData(ReadData) ,
.WriteData(WriteData) ,
.PC(PC) ,
.instr(instr) ,
.ALUResult(ALUOut) ,
.Zero_flag(Zero_flag) ,
.MemtoReg(MemtoReg) ,
.PCSrc(PCSrc) ,
.ALUControl(ALUControl) ,
.ALUSrc(ALUSrc) ,
.RegDst(RegDst) ,
.RegWrite(RegWrite) ,
.Jump(Jump) 
);

Control_Unit CU (
.OpCode(instr[31:26]) ,
.Funct(instr[5:0]) ,
.Zero_flag(Zero_flag) ,
.MemtoReg(MemtoReg) ,
.MemWrite(MemWrite) ,
.PCSrc(PCSrc) ,
.ALUControl(ALUControl) ,
.ALUSrc(ALUSrc) ,
.RegDst(RegDst) ,
.RegWrite(RegWrite)  ,
.Jump(Jump)
);


Instruction_Memory IM (
.PC(PC) ,
.RD(instr)
);

Data_Memory DM (
.CLK(clk_out2) ,
.RST(RST) ,
.WE(MemWrite) ,
.A(ALUOut) ,
.WD(WriteData) ,
.RD(ReadData) 
);

slow_clk sc(
.CLK(CLK),
.clk_out(clk_out));

slow_clk_refresh sc1(
.CLK(CLK),
.clk_out2(clk_out2));

 

wire [7:0]ca1,ca2,ca3,ca4,ca5,ca6,ca7,ca8;
reg [2:0]count=0;

always @(posedge clk_out )begin
case({count})
0:begin Ca<=ca1;   AN<=8'b11111110;    count<=count+1;  end
1:begin Ca<=ca2;   AN<=8'b11111101;    count<=count+1;  end
2:begin Ca<=ca3;   AN<=8'b11111011;    count<=count+1;  end
3:begin Ca<=ca4;   AN<=8'b11110111;    count<=count+1;  end
4:begin Ca<=ca5;   AN<=8'b11101111;    count<=count+1;  end
5:begin Ca<=ca6;   AN<=8'b11011111;    count<=count+1;  end
6:begin Ca<=ca7;   AN<=8'b10111111;    count<=count+1;  end
7:begin Ca<=ca8;   AN<=8'b01111111;    count<=count+1;  end
endcase
end

display d1(WriteData[3:0],ca1,clk_out);
display d2(WriteData[7:4],ca2,clk_out);
display d3(WriteData[11:8],ca3,clk_out);
display d4(WriteData[15:12],ca4,clk_out);
display d5(WriteData[19:16],ca5,clk_out);
display d6(WriteData[23:20],ca6,clk_out);
display d7(WriteData[27:24],ca7,clk_out);
display d8(WriteData[31:28],ca8,clk_out);

endmodule
