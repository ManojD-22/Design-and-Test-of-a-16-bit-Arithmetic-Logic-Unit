`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2025 17:59:04
// Design Name: 
// Module Name: tb_alu_16_bit
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


module tb_alu_16_bit #(parameter DATA_WIDTH = 16)();
    reg [DATA_WIDTH-1:0] A;
    reg [DATA_WIDTH-1:0] B;
    reg [DATA_WIDTH-12:0] opcode;
    reg valid;
    wire  [DATA_WIDTH-1:0] sum;
    wire  [DATA_WIDTH-1:0] substraction;
    wire  [DATA_WIDTH-1:0] multiplication;
    wire  [DATA_WIDTH-1:0] division;
    wire  AND_OPERATION;
    wire  OR_OPERATION;
    wire  XOR_OPERATION;
    wire  LEFT_SHIFT;
    wire  RIGHT_SHIFT;
    
    alu_16_bit #(.DATA_WIDTH(16)) DUT(
        .A(A),
        .B(B),
        .opcode(opcode),
        .valid(valid),
        .sum(sum),
        .substraction(substraction),
        .multiplication(multiplication),
        .division(division),
        .AND_OPERATION(AND_OPERATION),
        .OR_OPERATION(OR_OPERATION),
        .XOR_OPERATION(XOR_OPERATION),
        .LEFT_SHIFT(LEFT_SHIFT),
        .RIGHT_SHIFT(RIGHT_SHIFT)
    );
    always #5  A = A + 1;
    always #10 B = B + 1;
    always # 8 opcode = opcode + 1;
    
    initial begin
         A = 0;
         B = 0;
         opcode = 0;
         valid = 1;
         
         #500 $finish;
    end
    
    initial begin
        $monitor("%t | A : %b | B : %b | opcode : %b | valid : %b | sum : %b | substraction : %b | multiplication : %b | division : %b | AND_OPERATION : %b | OR_OPERATION : %b | XOR_OPERATION  %b | LEFT_SHIFT :%b | RIGHT_SHIFT : %b ",$time , A , B , opcode, valid , sum , substraction , multiplication, division, AND_OPERATION , OR_OPERATION , XOR_OPERATION , LEFT_SHIFT , RIGHT_SHIFT);
    end
    
endmodule
