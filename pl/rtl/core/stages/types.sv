typedef struct packed {
    logic [31:0] instr, pc, pcplus4
} if_id;

typedef struct packed {
    logic [31:0] rd1, rd2, pc, pcplus4,
    logic [4:0] rs1, rs2, rd,
    logic [31:0] immext,
    logic regwrite, memwrite, jump, branch, alusrc, 
    logic [1:0] resultsrc, 
    logic [2:0] alucontrol
} id_ex;

typedef struct packed {
    logic [31:0] aluresult, writedata, pcplus4,
    logic [4:0] rd,
    logic regwrite, memwrite,
    logic [1:0] resultsrc
} ex_mem;

typedef struct packed {
    logic [31:0] aluresult, readdata, pcplus4,
    logic [4:0] rd,
    logic regwrite,  
    logic [1:0] resultsrc
} mem_wb;