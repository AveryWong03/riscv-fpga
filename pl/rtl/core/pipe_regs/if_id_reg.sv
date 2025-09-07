`default_nettype none

module if_id_reg(
    input logic clk, clr, en,
    input logic [31:0] instr_i,
    input if_id_t d,
    output logic [31:0] instr_o,
    output if_id_t q
    
);

endmodule