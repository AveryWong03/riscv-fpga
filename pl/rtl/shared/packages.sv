package types;
    typedef struct packed {
        logic [31:0] pc;
        logic [31:0] pcplus4;
    } if_id_t;

    typedef struct packed {
        logic [31:0] pc;
        logic [31:0] pcplus4;
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
        logic [31:0] readdata;
        logic [31:0] pcplus4;
        logic [4:0] rd;
        logic regwrite;
        logic [1:0] resultsrc;
    } mem_wb_t;
endpackage

package constants;
    // ALU control
    localparam ALU_ADD = 3'b000;
    localparam ALU_SUB = 3'b001;
    localparam ALU_SLT = 3'b101;
    localparam ALU_SLTU = 3'b110; // Outside tb scope? - add later
    localparam ALU_OR  = 3'b011;
    localparam ALU_AND = 3'b010;

    // Instruction formats
    localparam TYPE_R       = 7'b0110011;
    localparam TYPE_I_ALU   = 7'b0010011;
    localparam TYPE_I_LOAD  = 7'b0000011;
    localparam TYPE_S       = 7'b0100011;
    localparam TYPE_B       = 7'b1100011;
    localparam TYPE_J       = 7'b1101111;
    localparam TYPE_U       = 7'b0110111;

endpackage