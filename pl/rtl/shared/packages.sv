package types;
    typedef struct packed {
        logic [31:0] pc;
        logic [31:0] pcplus4;
    } if_id_t;

    typedef struct packed {
        logic [31:0] pc;
        logic [31:0] pcplus4;
        logic [31:0] rd1;
        logic [31:0] rd2;
        logic [4:0] rs1;
        logic [4:0] rs2;
        logic [4:0] rd;
        logic [31:0] immext;
        logic regwrite;
        logic memwrite;
        logic jump;
        logic branch;
        logic alusrc;
        logic [1:0] resultsrc;
        logic [2:0] alucontrol;
    } id_ex_t;

    typedef struct packed {
        logic [31:0] aluresult;
        logic [31:0] writedata;
        logic [31:0] pcplus4;
        logic [4:0] rd;
        logic regwrite;
        logic memwrite;
        logic [1:0] resultsrc;
    } ex_mem_t;

    typedef struct packed {
        logic [31:0] aluresult;
        logic [31:0] pcplus4;
        logic [4:0] rd;
        logic regwrite;
        logic [1:0] resultsrc;
    } mem_wb_t;
endpackage

package constants;
    // ALU control
    localparam ALU_ADD  = 4'b0000;
    localparam ALU_SUB  = 4'b0001;
    localparam ALU_SLL  = 4'b0010;
    localparam ALU_SLT  = 4'b0011;
    localparam ALU_SLTU = 4'b0100; 
    localparam ALU_XOR  = 4'b0101;
    localparam ALU_SRL  = 4'b0110;
    localparam ALU_SRA  = 4'b0111;
    localparam ALU_OR   = 4'b1000;
    localparam ALU_AND  = 4'b1001;

    // Instruction formats
    localparam TYPE_R       = 7'b0110011;
    localparam TYPE_I_ALU   = 7'b0010011;
    localparam TYPE_I_LOAD  = 7'b0000011;
    localparam TYPE_S       = 7'b0100011;
    localparam TYPE_B       = 7'b1100011;
    localparam TYPE_J       = 7'b1101111;
    localparam TYPE_U       = 7'b0110111;

endpackage