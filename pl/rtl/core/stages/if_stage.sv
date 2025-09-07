`default_nettype none

module if_stage(
    input logic clk, en,
    input logic [31:0] pcsrc, pctarget,
    output if_id_t out,
    output logic [31:0] instr
);

logic [31:0] pc, pcplus4;
pc u_pc(
    .clk      (clk      ),
    .pctarget (pctarget ),
    .pcsrc    (pcsrc    ),
    .stall    (en    ),
    .pc       (pc       ),
    .pcplus4  (pcplus4  )
);

instr_mem u_instr_mem (
  .clka(clk),    // input wire clka
  .ena(1'b1),      // input wire ena
  .addra(pc),  // input wire [11 : 0] addra
  .douta(instr)  // output wire [31 : 0] douta
);

assign out.pc = pc;
assign out.pcplus4 = pcplus4;

endmodule