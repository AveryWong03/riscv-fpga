`default_nettype none

module ex_stage(
    input logic forwarda, forwardb,
    input id_ex in,
    output logic zero, 
    output logic [31:0] pcsrc,
    output logic [4:0] rs1, rs2,
    output ex_mem out  // resultsrc, rde need to be output to hazard unit as well
);

endmodule