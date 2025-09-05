`default_nettype none

module pc(
    input logic clk,
    input logic [31:0] pctarget,
    input logic pcsrc,
    input logic stall,
    output logic [31:0] pc, pcplus4
);

assign pcplus4 = pc + 32'd4;

logic [31:0] pcf_prime;
assign pcf_prime = pcsrc ? pctarget : pcplus4;

always_ff @(posedge clk)
    if(!stall)
        pc <= pcf_prime;

endmodule