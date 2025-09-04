`default_nettype none

module ctl_unit(
    input logic [6:0] op;
    input logic [2:0] funct3;
    input logic [6:0] funct7;
    output logic regwrite, memwrite, jump, branch, alusrc,
    output logic [1:0] resultsrc, immsrc,
    output logic [2:0] alucontrol
);

endmodule