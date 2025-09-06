`default_nettype none

module id_stage(
    input logic clk, we3,
    input logic [31:0] wd3,
    input logic [4:0] a3,
    input if_id_t in,
    output id_ex_t out // rs1, rs2 need to be output to hazard unit
);

logic [6:0] op, funct7;
logic [2:0] funct3;
logic [4:0] a1, a2;
logic [1:0] immsrc;

imm_gen u_imm_ged (
    .instr(in.instr),
    .immsrc(immsrc),
    .op(op),
    .funct3(funct3),
    .funct7(funct7),
    .a1(a1),
    .a2(a2),
    .rs1(out.rs1),
    .rs2(out.rs2),
    .rd(out.rd),
    .immext(out.immext)
);

regfile u_regfile (
    .clk(clk),
    .a1(a1),
    .a2(a2),
    .a3(a3),
    .wd3(wd3),
    .we3(we3),
    .rd1(out.rd1),
    .rd2(out.rd2)
);

ctl_unit u_ctl_unit (
    .op(op),
    .funct3(funct3),
    .funct7(funct7),
    .regwrite(out.regwrite),
    .memwrite(out.memwrite),
    .jump(out.jump),
    .branch(out.branch),
    .alusrc(out.alusrc),
    .resultsrc(out.resultsrc),
    .immsrc(immsrc),
    .alucontrol(out.alucontrol)
);

assign out.pc = in.pc;
assign out.pcplus4 = in.pcplus4;

endmodule