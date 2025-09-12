`default_nettype none

module if_stage(
    input logic clk, stall, pcsrc, 
    input logic [31:0] pctarget,
    output logic [31:0] instr,
    output if_id_t out
);

logic [31:0] pc, pcplus4;
pc u_pc(
    .clk      (clk      ),
    .pctarget (pctarget ),
    .pcsrc    (pcsrc    ),
    .stall    (stall    ),
    .pc       (pc       ),
    .pcplus4  (pcplus4  )
);

instr_mem u_instr_mem (
  .clka(clk),    // input wire clka
  .addra(pc[31:2]),  // word-aligned instruction fetch
  .douta(instr),  // output wire [31 : 0] douta
  .ena(!stall)
);

assign out.pc = pc;
assign out.pcplus4 = pcplus4;

endmodule