# Implementation-of-Single-Cycle-MIPS-Processor-on-Nexys4-DDR
A single-cycle MIPS processor is a type of CPU design where each instruction executes in a single clock cycle. In this design, 
the processor completes all the instructions like R-type,I-type and J-type instructions can be executed in one clock cycle individually.
The MIPS (Microprocessor without Interlocked Pipeline Stages) architecture is a reduced instruction set computing (RISC) architecture 
commonly used in embedded systems, educational settings,and some low-power applications. A single-cycle MIPS processor design simplifies 
the control logic but can be less efficient in terms of hardware utilization and speed compared to pipelined or multi-cycle designs.
In a single-cycle MIPS processor, every instruction, regardless of complexity, takes the same amount of time to execute.
While this simplicity can be advantageous for educational purposes and understanding the basic workings of a processor, 
it's not as common in modern high-performance processors due to its limitations in clock speed and hardware utilization efficiency.

The below instructions can be executed in this processor :
1.R-type instructions: 
                       a. AND
                       b. OR
                       c.MUL
                       D.ADD
                       E.SUB
                       F.SLT(SET LESS THAN)
2.I-type instructions:
                       a.ADDI
                       b.SUBI
                       c.LW(load word)
                       d.SW(store word)
                       e.BEQ(branch if equal)
3.J-type instructions:
                      a. Jump




                       
