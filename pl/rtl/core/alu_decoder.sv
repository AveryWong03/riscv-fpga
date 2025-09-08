`default_nettype none
import constants::*;

module alu_decoder (
    input logic [2:0] funct3,
    input logic op_5,
    input logic funct7_5,
    input logic [1:0] aluop,
    output logic [2:0] alucontrol 
);
    logic[1:0] op_funct = {op_5, funct7_5};

    always_comb begin
        case(aluop)
            2'b00: alucontrol = ALU_ADD;
            2'b01: alucontrol = ALU_SUB;
            2'b10: begin
                case(funct3)
                    3'b000: begin
                        if(op_funct == 2'b11) alucontrol = ALU_SUB; 
                        else alucontrol = ALU_ADD; end
                    3'b010: alucontrol = ALU_SLT;
                    3'b110: alucontrol = ALU_OR;
                    3'b111: alucontrol = ALU_AND;
                    default: alucontrol = 0;  
                endcase
            end
            default: alucontrol = 0;
        endcase
    end

endmodule