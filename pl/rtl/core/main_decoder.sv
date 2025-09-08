`default_nettype none
import constants::*;

module main_decoder (
    input logic [6:0] op,
    output logic regwrite, memwrite, jump, branch, alusrc,
    output logic [1:0] resultsrc, immsrc, aluop
);

import constants::*;

    always_comb begin
        case(op)
            TYPE_R: begin
                // Order here is based off tb table 7.6
                regwrite    = 1;
                immsrc      = 2'b00; // xx
                alusrc      = 0;
                memwrite    = 0;
                resultsrc   = 2'b00;
                branch      = 0;
                aluop       = 2'b10;
                jump        = 0; 
            end
            TYPE_I_ALU: begin
                regwrite    = 1;
                immsrc      = 2'b00; 
                alusrc      = 1;
                memwrite    = 0;
                resultsrc   = 2'b00;
                branch      = 0;
                aluop       = 2'b10;
                jump        = 0; 
            end
            TYPE_I_LOAD: begin
                regwrite    = 1;
                immsrc      = 2'b00; 
                alusrc      = 1;
                memwrite    = 0;
                resultsrc   = 2'b01;
                branch      = 0;
                aluop       = 2'b00;
                jump        = 0; 
            end
            TYPE_S: begin
                regwrite    = 0;
                immsrc      = 2'b01; 
                alusrc      = 1;
                memwrite    = 1;
                resultsrc   = 2'b00; // xx
                branch      = 0;
                aluop       = 2'b00;
                jump        = 0; 
            end
            TYPE_B: begin
                regwrite    = 0;
                immsrc      = 2'b10; 
                alusrc      = 0;
                memwrite    = 0;
                resultsrc   = 2'b00; // xx
                branch      = 1;
                aluop       = 2'b01;
                jump        = 0; 
            end
            TYPE_J: begin
                regwrite    = 1;
                immsrc      = 2'b11; 
                alusrc      = 0; // x
                memwrite    = 0;
                resultsrc   = 2'b10; 
                branch      = 0;
                aluop       = 2'b00; // xx
                jump        = 1; 
            end
            //TYPE_U:
            default: begin
                regwrite    = 0;
                immsrc      = 2'b00; 
                alusrc      = 0;
                memwrite    = 0;
                resultsrc   = 2'b00; 
                branch      = 0;
                aluop       = 2'b00;
                jump        = 0; 
            end
        endcase
        
    end
endmodule