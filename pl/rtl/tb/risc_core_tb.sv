`default_nettype none

module risc_core_tb();

logic clk;
logic [31:0] result;

risc_core u_risc_core(
    .clk    (clk    ),
    .result (result )
);

initial begin
    clk = 0; 
    $readmemh("regfile_init.hex", u_risc_core.u_id_stage.u_regfile.rf);
    # 500
    $finish;
end

always #1 clk = ~clk;


endmodule