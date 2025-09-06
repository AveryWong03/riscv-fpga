`default_nettype none

module ctl_unit(
    input logic [6:0] op,
    input logic [2:0] funct3,
    input logic [6:0] funct7,
    output logic regwrite, memwrite, jump, branch, alusrc,
    output logic [1:0] resultsrc, immsrc,
    output logic [2:0] alucontrol
);

    logic [1:0] aluop;
    main_decoder u_main_decoder(
        .op        (op        ),
        .regwrite  (regwrite  ),
        .memwrite  (memwrite  ),
        .jump      (jump      ),
        .branch    (branch    ),
        .alusrc    (alusrc    ),
        .resultsrc (resultsrc ),
        .immsrc    (immsrc    ),
        .aluop     (aluop     )
    );
    
    alu_decoder u_alu_decoder(
        .funct3     (funct3     ),
        .op_5       (op[5]       ),
        .funct7_5   (funct7[5]     ),
        .aluop      (aluop      ),
        .alucontrol (alucontrol )
    );
    

    module main_decoder (
        input logic [6:0] op,
        output logic regwrite, memwrite, jump, branch, alusrc,
        output logic [1:0] resultsrc, immsrc, aluop
    );

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
                TYPE_I_ALU:
                    regwrite    = 1;
                    immsrc      = 2'b00; 
                    alusrc      = 1;
                    memwrite    = 0;
                    resultsrc   = 2'b00;
                    branch      = 0;
                    aluop       = 2'b10;
                    jump        = 0; 
                TYPE_I_LOAD:
                    regwrite    = 1;
                    immsrc      = 2'b00; 
                    alusrc      = 1;
                    memwrite    = 0;
                    resultsrc   = 2'b01;
                    branch      = 0;
                    aluop       = 2'b00;
                    jump        = 0; 
                TYPE_S:
                    regwrite    = 0;
                    immsrc      = 2'b01; 
                    alusrc      = 1;
                    memwrite    = 1;
                    resultsrc   = 2'b00; // xx
                    branch      = 0;
                    aluop       = 2'b00;
                    jump        = 0; 
                TYPE_B:
                    regwrite    = 0;
                    immsrc      = 2'b10; 
                    alusrc      = 0;
                    memwrite    = 0;
                    resultsrc   = 2'b00; // xx
                    branch      = 1;
                    aluop       = 2'b01;
                    jump        = 0; 
                TYPE_J:
                    regwrite    = 1;
                    immsrc      = 2'b11; 
                    alusrc      = 0; // x
                    memwrite    = 0;
                    resultsrc   = 2'b10; 
                    branch      = 0;
                    aluop       = 2'b00; // xx
                    jump        = 1; 
                //TYPE_U:
                default: 
                    regwrite    = 0;
                    immsrc      = 2'b00; 
                    alusrc      = 0;
                    memwrite    = 0;
                    resultsrc   = 2'b00; 
                    branch      = 0;
                    aluop       = 2'b00;
                    jump        = 0; 
            endcase
            
        end
    endmodule

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

endmodule