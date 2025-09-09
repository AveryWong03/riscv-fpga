`default_nettype none

module id_ex_reg(
    input logic clk, flush,
    input id_ex_t d,
    output id_ex_t q
);
    id_ex_t q_reg = '0;
    assign q = q_reg;

    always_ff @(posedge clk) begin
        if(flush) q_reg <= '0;
        else q_reg <= d;
    end

endmodule