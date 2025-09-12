`default_nettype none

module if_id_reg(
    input logic clk, flush, stall,
    input if_id_t d,
    output if_id_t q
    
);

    if_id_t q_reg = '0;
    assign q = q_reg;

    always_ff @(posedge clk) begin
        if(flush) q_reg <= '0;
        else if(stall) q_reg <= q_reg;
        else q_reg <= d;
    end

endmodule