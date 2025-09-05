`default_nettype none

module if_stage_tb();

logic clk,en;
logic [31:0] pcsrc, pctarget;
if_id_t out;

if_stage u_if_stage(
    .clk      (clk      ),
    .en       (en       ),
    .pcsrc    (pcsrc    ),
    .pctarget (pctarget ),
    .out      (out      )
);

initial begin
    clk = 0; 
    en = 0;
    pc_src = 0;
    pctarget = 18; # 8;
    pc_src = 1;
    
    # 500
    $finish;
end

always #1 clk = ~clk;


endmodule