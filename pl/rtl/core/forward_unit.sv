`default_nettype none

module foward_unit(
    input logic [31:0] rd1, rd2, result, aluresult, immext,
    input logic [1:0] forwarda, forwardb,
    input logic alusrc,
    output logic [31:0] srca, srcb, writedata
);
// ALU src select
always_comb begin
    case(forwarda)
        2'b00: srca = rd1;
        2'b01: srca = result;
        2'b10: srca = aluresult;
        default: srca = 0;
    endcase 
end

always_comb begin
    case(forwardb)
        2'b00: writedata = rd2;
        2'b01: writedata = result;
        2'b10: writedata = aluresult;
        default: writedata = 0;
    endcase 
end
assign srcb = (alusrc) ? immext : writedata;
endmodule