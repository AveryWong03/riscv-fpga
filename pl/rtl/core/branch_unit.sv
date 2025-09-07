`default_nettype none

module branch_unit(
    input logic zero, branch, jump,
    output logic pcsrc
);

assin pcsrc = (zero & branch) | jump;

endmodule 