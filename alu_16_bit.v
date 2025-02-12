`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2025 17:17:17
// Design Name: 
// Module Name: alu_16_bit
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


module alu_16_bit #(parameter DATA_WIDTH = 16)(
    input [DATA_WIDTH-1:0] A,
    input [DATA_WIDTH-1:0] B,
    input [DATA_WIDTH-12:0] opcode,
    input valid,
    output reg [DATA_WIDTH-1:0] sum,
    output reg [DATA_WIDTH-1:0] substraction,
    output reg [DATA_WIDTH-1:0] multiplication,
    output reg [DATA_WIDTH-1:0] division,
    output reg AND_OPERATION,
    output reg OR_OPERATION,
    output reg XOR_OPERATION,
    output reg LEFT_SHIFT,
    output reg RIGHT_SHIFT
    );
    
    always@(*)begin
        if(!valid)begin
            sum             = 16'b0;
            substraction    = 16'b0;
            multiplication  = 16'b0;
            division         = 16'b0;
            AND_OPERATION    = 1'b0;
            OR_OPERATION     = 1'b0;
            XOR_OPERATION    = 1'b0;
            LEFT_SHIFT       = 1'b0;
            RIGHT_SHIFT      = 1'b0;
        end else begin
            case(opcode[3:0])
                4'b0000:sum            = A + B;
                4'b0001:substraction   = A - B;
                4'b0010:multiplication = A * B;
                4'b0011:division       = A / B;
                4'b0100:AND_OPERATION  = A & B;
                4'b0101:OR_OPERATION   = A | B;
                4'b0110:XOR_OPERATION  = A ^ B;
                4'b0111:LEFT_SHIFT     = A << 1;
                4'b1000:RIGHT_SHIFT    = A >> 1;
                
                default: begin
                    sum            =  16'b0;
                    substraction   =  16'b0;
                    multiplication =  16'b0;
                    division       =  16'b0;
                    AND_OPERATION  =  1'b0;
                    OR_OPERATION   =  1'b0;
                    XOR_OPERATION  =  1'b0;
                    LEFT_SHIFT     =  1'b0;
                    RIGHT_SHIFT    =  1'b0;
                end
            endcase
        end
       
    end
endmodule
