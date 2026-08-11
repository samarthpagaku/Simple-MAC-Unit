module mac (
    input clk,
    input rst,
    input en,
    input  [7:0] a,
    input  [7:0] b,
    output [31:0] acc
);

wire [15:0] prod;

multiplier MUL (.a(a),.b(b),.t(prod));

accumulator ACC (.prod(prod),.en(en),.clk(clk),.rst(rst),.acc(acc));

endmodule
