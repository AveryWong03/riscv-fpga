typedef struct packed {
    logic [31:0] instr;
    logic [31:0] pc;
    logic [31:0] pcplus4;
} if_id_t;

typedef struct packed {
    logic [31:0] rd1;
    logic [31:0] rd2;
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
