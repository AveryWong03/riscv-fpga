`default_nettype none

module ex_stage(
    input logic [1:0] forwarda, forwardb,
    input id_ex_t in,
    input logic [31:0] result_w, aluresult_m,
    input logic [31:0] rd1, rd2,
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

foward_unit u_foward_unit(
    .rd1       (rd1       ),
    .rd2       (rd2       ),
    .result    (result_w    ),
    .aluresult (aluresult_m ),
    .immext    (in.immext    ),
    .forwarda  (forwarda  ),
    .forwardb  (forwardb  ),
    .alusrc    (in.alusrc    ),
    .srca      (srca      ),
    .srcb      (srcb      ),
    .writedata (out.writedata )
);

// PC target
assign pctarget = in.pc + in.immext;

// Pass through output assignments
assign out.pcplus4 = in.pcplus4;
assign out.rd = in.rd;
assign out.regwrite =  in.regwrite;
assign out.resultsrc = in.resultsrc;
assign out.memwrite = in.memwrite; 

endmodule