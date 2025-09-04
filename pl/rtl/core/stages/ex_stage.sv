`default_nettype none

module ex_stage(
    input logic forwarda, forwardb,
    input id_ex_t in,
    input logic [31:0] result, aluresult,
    output logic [31:0] pctarget,
    output logic pcsrc,
    output ex_mem_t out  // resultsrc, rde need to be output to hazard unit as well
);

endmodule