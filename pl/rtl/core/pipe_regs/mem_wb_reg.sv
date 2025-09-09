`default_nettype none

module mem_wb_reg(
    input logic clk,
    input mem_wb_t d,
    output mem_wb_t q
);
    mem_wb_t q_reg = '0;
    assign q = q_reg;

    always_ff @(posedge clk) begin
        q_reg <= d;
    end
    
endmodule