`default_nettype none

module id_ex_reg(
    input logic clk, flush,
    input id_ex_t d,
    input logic [31:0] rd1_i, rd2_i,
    output logic [31:0] rd1_o, rd2_o,
    output id_ex_t q
);

    always_ff @(posedge clk) begin
        if(flush) q <= '0;
        else q <= d;
    end

    assign rd1_o = flush ? '0 : rd1_i;
    assign rd2_o = flush ? '0 : rd2_i;

endmodule