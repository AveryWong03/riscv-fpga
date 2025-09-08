`default_nettype none

module risc_core(  
    input logic clk,
    output logic [31:0] result
);

logic stall_f;
logic stall_d;
logic flush_d;
logic flush_e;
logic [1:0] forwarda, forwardb;

haz_unit u_haz_unit(
    .rs1_d      (id_o.rs1      ),
    .rs2_d      (id_o.rs2      ),
    .rs1_e      (ex_i.rs1      ),
    .rs2_e      (ex_i.rs2     ),
    .rd_e       (ex_i.rd      ),
    .rd_m       (mem_i.rd       ),
    .rd_w       (rd_w       ),
    .pcsrc      (pcsrc_e      ),
    .regwrite_m (mem_i.regwrite  ),
    .regwrite_w (regwrite_w ),
    .resultsrc  (ex_i.resultsrc),
    .stall_f    (stall_f    ),
    .stall_d    (stall_d    ),
    .flush_d    (flush_d    ),
    .flush_e    (flush_e    ),
    .forwarda   (forwarda   ),
    .forwardb   (forwardb   )
);


if_id_t if_o; 
logic [31:0] instr_f;
if_stage u_if_stage(
    .clk      (clk      ),
    .stall       (stall_f       ),
    .pcsrc    (pcsrc_e   ),
    .pctarget (pctarget_e ),
    .out      (if_o     ),
    .instr    (instr_f)
);

if_id_t id_i;
logic [31:0] instr_d;
if_id_reg u_if_id_reg(
    .clk (clk ),
    .flush (flush_d ),
    .stall  (stall_d ),
    .instr_i (instr_f),
    .d   (if_o   ),
    .instr_o (instr_d),
    .q   (id_i   )
);


id_ex_t id_o;
logic [31:0] rd1_d, rd2_d;
id_stage u_id_stage(
    .clk (clk        ),
    .we3 (regwrite_w),
    .wd3 (result_w),
    .a3  (rd_w),
    .instr(instr_d),
    .in  (id_i         ),
    .out (id_o        ),
    .rd1 (rd1_d),
    .rd2 (rd2_d)
);

id_ex_t ex_i;
logic [31:0] rd1_e, rd2_e;
id_ex_reg u_id_ex_reg(
    .clk (clk ),
    .flush (flush_e ),
    .d   (id_o   ),
    .rd1_i(rd1_d),
    .rd2_i(rd2_d),
    .rd1_o(rd1_e),
    .rd2_o(rd2_e),    
    .q   (ex_i   )
);

ex_mem_t ex_o;
logic [31:0] pctarget_e;
logic pcsrc_e;
ex_stage u_ex_stage(
    .forwarda  (forwarda ),
    .forwardb  (forwardb ),
    .rd1       (rd1_e),
    .rd2       (rd2_e),
    .in        (ex_i       ),
    .result_w    (result_w),
    .aluresult_m (aluresult_m),
    .pctarget  (pctarget_e),
    .pcsrc     (pcsrc_e),
    .out       (ex_o      )
);

ex_mem_t mem_i;
ex_mem_reg u_ex_mem_reg(
    .clk (clk ),
    .d   (ex_o   ),
    .q   (mem_i   )
);

mem_wb_t mem_o;
logic [31:0] aluresult_m;
logic [31:0] readdata_m;
mem_stage u_mem_stage(
    .clk (clk ),
    .in  (mem_i  ),
    .aluresult (aluresult_m),
    .out (mem_o ),
    .readdata(readdata_m)
);

mem_wb_t wb_i;
logic [31:0] readdata_w;
mem_wb_reg u_mem_wb_reg(
    .clk (clk ),
    .d   (mem_o   ),
    .readdata_i(readdata_m),
    .readdata_o(readdata_w),
    .q   (wb_i   )
);

logic [31:0] result_w;
logic regwrite_w;
logic [4:0] rd_w;
wb_stage u_wb_stage(
    .in       (wb_i       ),
    .regwrite (regwrite_w ),
    .rd       (rd_w       ),
    .result   (result_w   )
);

assign result = result_w;

endmodule