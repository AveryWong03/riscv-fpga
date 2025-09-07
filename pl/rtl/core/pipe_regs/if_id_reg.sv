`default_nettype none

module if_id_reg(
    input logic clk, flush, stall,
    input logic [31:0] instr_i,
    input if_id_t d,
    output logic [31:0] instr_o,
    output if_id_t q
    
);

    always_ff @(posedge clk) begin
        if(flush) q <= '0;
        else if(stall) q <= q;
        else q <= d;
    end

    // instr_i comes from bram memory that is already registered on the clock
    assign instr_o = flush ? '0 : instr_i;

endmodule