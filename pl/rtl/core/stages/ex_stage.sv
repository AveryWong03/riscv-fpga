`default_nettype none

module ex_stage(
    input logic forwarda, forwardb,
    input id_ex_t in,
    output logic [31:0] pctarget,
    output logic pcsrc,
    output logic [4:0] rs1, rs2,
    output ex_mem_t out  // resultsrc, rde need to be output to hazard unit as well
);

endmodule