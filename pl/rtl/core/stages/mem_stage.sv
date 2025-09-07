`default_nettype none

module mem_stage(
    input logic clk,
    input ex_mem_t in,
    output logic [31:0] aluresult,
    output mem_wb_t out,
    output logic [31:0] readdata
);

regfile_mem u_data_mem (
  .clka(clk),    // input wire clka
  .wea(in.memwrite),      // input wire [0 : 0] wea
  .addra(in.aluresult),  // input wire [4 : 0] addra <= incorrect for now
  .dina(in.writedata),    // input wire [31 : 0] dina
  .douta(out.readdata),  // output wire [31 : 0] douta
);

// Pass through output assignments
assign out.aluresult = in.aluresult;
assign out.rd = in.rd;
assign out.pcplus4 = in.pcplus4;
assign out.regwrite = in.regwrite;
assign out.resultsrc = in.resultsrc;


endmodule