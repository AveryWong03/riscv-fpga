`default_nettype none

module mem_wb_reg(
    input logic clk,
    input mem_wb_t d,
    input logic [31:0] readdata_i,
    output logic [31:0] readdata_o, 
    output mem_wb_t q
);
    always_ff @(posedge clk) begin
        q <= d;
    end
    
    assign readdata_o = readdata_i;

endmodule