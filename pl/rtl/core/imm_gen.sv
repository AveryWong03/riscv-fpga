`default_nettype none

module imm_gen(
    input logic [31:0] instr,
    output logic [6:0] op,
    output logic [2:0] funct3,
    output logic [6:0] funct7,
    output logic [4:0] a1, a2,
    output logic [4:0] rs1, rs2, rd,
    output logic [31:0] immext
);

endmodule