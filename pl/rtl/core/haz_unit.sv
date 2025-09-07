`default_nettype none

module haz_unit(
    input logic [4:0] rs1_d, rs2_d, rs1_e, rs2_e, rd_e, rd_m, rd_w,
    input logic pcsrc, regwrite_m, regwrite_w,
    input logic [1:0] resultsrc,
    output logic stall_f, stall_d, flush_d, flush_e,
    output logic [1:0] forwarda, forwardb
);

always_comb begin
    if(((rs1_e == rd_m) && regwrite_m) && (rs1_e != 0))
        forwarda = 2'b10;
    else if(((rs1_e == rd_w) && regwrite_w) && (rs1_e != 0))
        forwarda = 2'b01;
    else forwarda = 2'b00;
end

always_comb begin
    if(((rs2_e == rd_m) && regwrite_m) && (rs2_e != 0))
        forwardb = 2'b10;
    else if(((rs2_e == rd_w) && regwrite_w) && (rs2_e != 0))
        forwardb = 2'b01;
    else forwardb = 2'b00;
end

logic lwstall = resultsrc[0] && ((rs1_d == rd_e) || (rs2_d == rd_e));
assign stall_f = lwstall;
assign stall_d = lwstall;
assign flush_e = lwstall || pcsrc;
assign flush_d = pcsrc;

endmodule