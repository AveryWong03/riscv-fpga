`default_nettype none

module wb_stage(
    input mem_wb_t in,
    input logic [31:0] readdata, 
    output logic regwrite,
    output logic [4:0] rd,
    output logic [31:0] result
);

always_comb begin
    case(in.resultsrc)
        2'b00: result = in.aluresult;
        2'b01: result = readdata;
        2'b10: result = in.pcplus4;
        default: result = 0;
    endcase
end

// Pass through output assignments
assign rd = in.rd; 
assign regwrite = in.regwrite;

endmodule