`default_nettype none

module id_stage(
    input logic clk, we3,
    input logic [31:0] wd3,
    input logic [4:0] a3,
    input if_id_t in,
    output id_ex_t out // rs1, rs2 need to be output to hazard unit
);

blk_mem_gen_0 instruction_memory (
  .clka(clka),    // input wire clka
  .ena(ena),      // input wire ena
  .wea(wea),      // input wire [0 : 0] wea
  .addra(addra),  // input wire [12 : 0] addra
  .dina(dina),    // input wire [31 : 0] dina
  .douta(douta)  // output wire [31 : 0] douta
);

endmodule