`default_nettype none

module wb_stage(
    input mem_wb_t in,
    input [31:0] readdata,
    input [2:0] funct3,
    output logic regwrite,
    output logic [4:0] rd,
    output logic [31:0] result
);

always_comb begin
    case(in.resultsrc)
        2'b00: result = in.aluresult;
        2'b01: result = readdata_sel;
        2'b10: result = in.pcplus4;
        default: result = 0;
    endcase
end

// Readdata data select
logic [31:0] readdata_sel;
always_comb begin
    case(funct3)
        3'b000: readdata_sel = {24{readdata[7]}, readdata[7:0]};
        3'b001: readdata_sel = {16{readdata[15]}, readdata[15:0]};
        3'b010: readdata_sel = readdata;
        3'b100: readdata_sel = {24'b0, readdata[7:0]};
        3'b101: readdata_sel = {16'b0, readdata[15:0]};
        default: readdata_sel = 0;
    endcase
end

// Pass through output assignments
assign rd = in.rd; 
assign regwrite = in.regwrite;

endmodule