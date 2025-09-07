// constants_pkg.sv
package constants;
    // ALU control
    localparam ALU_ADD = 3'b000;
    localparam ALU_SUB = 3'b001;
    localparam ALU_SLT = 3'b101;
    localparam ALU_SLT = 3'b110; // Outside tb scope? - add later
    localparam ALU_OR  = 3'b011;
    localparam ALU_AND = 3'b010;

    // Instruction formats
    localparam TYPE_R       = 7'b0110011;
    localparam TYPE_I_ALU   = 7'b0010011;
    localparam TYPE_I_LOAD  = 7'b0000011;
    localparam TYPE_S       = 7'b0100011;
    localparam TYPE_B       = 7'b1100011;
    localparam TYPE_J       = 7'b1101111;
    localparam TYPE_U       = 7'b0110111;

endpackage