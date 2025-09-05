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
blk_mem_gen_0 your_instance_name (
  .clka(clk),    // input wire clka
  .ena(1'b1),      // input wire ena
  .wea(1'b0),      // input wire [0 : 0] wea
  .addra(pc),  // input wire [12 : 0] addra
  .dina(32'b0),    // input wire [31 : 0] dina
  .douta(if_id_input.instr)  // output wire [31 : 0] douta
);


assign if_id_input.pc = pc;
assign if_id_input.pcplus4 = pcplus4;
assign out = if_id_input;

endmodule