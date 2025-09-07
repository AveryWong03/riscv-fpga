`default_nettype none

module alu(
    input logic [31:0] srca, srcb,
    input logic [2:0] alucontrol,
    output logic [31:0] aluresult,
    output logic zero
);

always_comb begin
    case(alucontrol)
        ALU_ADD: aluresult = srca + srcb;
        ALU_SUB: aluresult = srca - srcb;
        ALU_SLT: aluresult = ($signed(srca) < $signed(srcb)) ? 1 : 0;
        ALU_OR: aluresult = srca | srcb;
        ALU_AND: aluresult = srca & srcb;
        default: aluresult = 0;
    endcase
end

assign zero = (aluresult == 32'b0);

endmodule