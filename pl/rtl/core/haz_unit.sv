`default_nettype none

module haz_unit(
    input logic [4:0] rs1_d, rs2_d, rs1_e, rs2_e, rd_e, rd_m, rd_w,
    input logic pcsrc, regwrite_m, regwrite_w,
    output logic stall_f, stall_d, flush_d, flush_e,
    output logic [1:0] forwarda, forwardb
);

endmodule