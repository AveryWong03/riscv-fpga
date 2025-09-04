`default_nettype none

module haz_unit(
    input logic [4:0] rs1d, rs2d, rs1e, rs2e, rde, rdm, rdw,
    input logic pcsrc, resultsrc, regwritem, regwritew,
    output logic stallf, stalld, flushd, flushe,
    output logic [1:0] forwarda, forwardb
);

endmodule