`default_nettype none

module branch_unit(
    input logic zero, branch, jump,
    output logic pcsrc
);

assign pcsrc = (zero & branch) | jump;

endmodule 