`default_nettype none

module imm_gen(
    input logic [31:0] instr,
    input logic [1:0] immsrc,
    output logic [6:0] op,
    output logic [2:0] funct3,
    output logic [6:0] funct7,
    output logic [4:0] a1, a2,
    output logic [4:0] rs1, rs2, rd,
    output logic [31:0] immext
);

assign op       = instr[6:0];
assign rd       = instr[11:7];
assign funct3   = instr[14:12];
assign rs1      = instr[19:15];
assign rs2      = instr[24:20];
assign funct7   = instr[31:25];

always_comb begin
    case(immsrc)
        0: immext = {{20{instr[31]}}, instr[31:20]}; // I
        1: immext = {{20{instr[31]}}, instr[31:25], instr[11:7]}; // S
        2: immext = {{20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0}; // B
        3: immext = {{12{instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0}; // J
        default: immext = 0;
    endcase
end

endmodule