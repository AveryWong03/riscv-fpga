`default_nettype none

module ex_mem_reg(
    input logic clk,
    input ex_mem_t d,
    output ex_mem_t q
);

    always_ff @(posedge clk) begin
        q <= d;
    end

endmodule