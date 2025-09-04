`default_nettype none

`include "../core/stages/types.sv"

module risc_core(  
    input logic clk
);

logic stall_f;
logic stall_d;
logic flush_d;
logic flush_e;

haz_unit u_haz_unit(
    .rs1_d      (id_o.rs1      ),
    .rs2_d      (id_o.rs2      ),
    .rs1_e      (ex_i.rs1      ),
    .rs2_e      (ex_i.rs2     ),
    .rd_e       (ex_i.rd      ),
    .rd_m       (mem_i.rd       ),
    .rd_w       (wb_i.rd       ),
    .pcsrc      (pcsrc_e      ),
    .regwrite_m (mem_i.regwrite  ),
    .regwrite_w (wb_i.regwrite ),
    .stall_f    (stall_f    ),
    .stall_d    (stall_d    ),
    .flush_d    (flush_d    ),
    .flush_e    (flush_e    ),
    .forwarda   (forwarda   ),
    .forwardb   (forwardb   )
);


if_id_t if_o; 
if_stage u_if_stage(
    .clk      (clk      ),
    .en       (stall_f       ),
    .pcsrc    (pcsrc_e   ),
    .pctarget (pctarget_e ),
    .out      (if_o     )
);

if_id_t id_i;
if_id_reg u_if_id_reg(
    .clk (clk ),
    .clr (flush_d ),
    .en  (stall_d ),
    .d   (if_o   ),
    .q   (id_i   )
);

// TODO: Left off here, also reformat port order might be nice

id_ex_t id_o;
id_stage u_id_stage(
    .clk        (clk        ),
    .regwrite_w (),
    .wd3        ()
    .a3         ()
    .in         (id_i         ),
    .out        (id_o        )
);

id_ex_t ex_i;
id_ex_reg u_id_ex_reg(
    .clk (clk ),
    .clr (flush_e ),
    .d   (id_o   ),
    .q   (ex_i   )
);

ex_mem_t ex_o;
logic [31:0] pctarget_e;
logic pcsrc_e;
ex_stage u_ex_stage(
    .forwarda (forwarda ),
    .forwardb (forwardb ),
    .in       (ex_i       ),
    .pctarget (pctarget_e)
    .pcsrc    (pcsrc_e),
    .rs1      (rs1_e      ),
    .rs2      (rs2_e      ),
    .out      (ex_o      )
);

ex_mem_t mem_i;
ex_mem_reg u_ex_mem_reg(
    .clk (clk ),
    .d   (ex_o   ),
    .q   (mem_i   )
);

mem_wb_t mem_o;
mem_stage u_mem_stage(
    .clk (clk ),
    .in  (mem_i  ),
    .out (mem_o )
);

mem_wb_t wb_i;
mem_wb_reg u_mem_wb_reg(
    .clk (clk ),
    .d   (mem_o   ),
    .q   (wb_i   )
);

wb_stage u_wb_stage(
    .in       (wb_i       ),
    .regwrite (regwrite ),
    .rd       (rd       ),
    .result   (result   )
);





endmodule