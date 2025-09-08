`default_nettype none
import types::*;

module ex_mem_reg(
    input logic clk,
    input ex_mem_t d,
    output ex_mem_t q
);
    ex_mem_t q_reg = '0;  // Initialize the internal register
    assign q = q_reg;
    
    always_ff @(posedge clk) begin
        q_reg <= d;
    end

endmodule