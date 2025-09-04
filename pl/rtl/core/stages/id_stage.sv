`default_nettype none

module id_stage(
    input logic clk, we3,
    input logic [31:0] wd3,
    input logic [4:0] a3,
    input if_id_t in,
    output id_ex_t out // rs1, rs2 need to be output to hazard unit
);

endmodule