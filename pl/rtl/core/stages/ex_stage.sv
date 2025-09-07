`default_nettype none

module ex_stage(
    input logic [1:0] forwarda, forwardb,
    input id_ex_t in,
    input logic [31:0] result_w, aluresult_m,
    output logic [31:0] pctarget,
    output logic pcsrc,
    output ex_mem_t out  // resultsrc, rde need to be output to hazard unit as well
);

logic [31:0] srca, srcb;

logic zero;
alu u_alu(
    .srca       (srca       ),
    .srcb       (srcb       ),
    .alucontrol (in.alucontrol ),
    .aluresult  (out.aluresult  ),
    .zero       (zero       )
);

branch_unit u_branch_unit(
    .zero   (zero   ),
    .branch (in.branch ),
    .jump   (in.jump   ),
    .pcsrc  (pcsrc  )
);

// ALU src select
always_comb begin
    case(forwarda)
        2'b00: srca = in.rd1;
        2'b01: srca = result_w;
        2'b10: srca = aluresult_m;
        default: srca = 0;
    endcase 
end

always_comb begin
    case(forwardb)
        2'b00: out.writedata = in.rd2;
        2'b01: out.writedata = result_w;
        2'b10: out.writedata = aluresult_m;
        default: out.writedata = 0;
    endcase 
end
assign srcb = (in.alusrc) ? in.immext : out.writedata;

// PC target
assign pctarget = in.pc + in.immext;

// Pass through output assignments
assign out.pcplus4 = in.pcplus4;
assign out.rd = in.rd;
assign out.regwrite =  in.regwrite;
assign out.resultsrc = in.resultsrc;
assign out.memwrite = in.memwrite; 

endmodule