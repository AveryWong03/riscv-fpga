`default_nettype none

module if_stage(
    input logic clk, en,
    input logic [31:0] pcsrc, pctarget,
    output if_id_t out
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

if_id_t if_id_input;

instr_mem your_instance_name (
  .clka(clka),    // input wire clka
  .ena(1'b1),      // input wire ena
  .addra(pc),  // input wire [11 : 0] addra
  .douta(if_id_input.instr)  // output wire [31 : 0] douta
);

assign if_id_input.pc = pc;
assign if_id_input.pcplus4 = pcplus4;
assign out = if_id_input;

endmodule