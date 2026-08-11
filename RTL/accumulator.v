module accumulator (
    input  [15:0] prod,
    input         en,
    input         clk,
    input         rst,
    output reg [31:0] acc   //can use just output as well 
);

wire [31:0] prod_ext;
wire [31:0] sum;
wire [32:0] carry;

assign prod_ext = {16'b0, prod};

// Bit 0
ha H (prod_ext[0],acc[0],sum[0],carry[1]);

// Bits 1-31
genvar i;
generate
    for (i = 1; i < 32; i = i + 1) begin : ADDER // 32 bit rca using generate_block

        fa F (prod_ext[i],acc[i],carry[i],sum[i],carry[i+1]);

    end
endgenerate

always @(posedge clk or posedge rst) begin

    if (rst)
        acc <= 32'b0;

    else if (en)
        acc <= sum;

end

endmodule

module fa(input a,b,cin,output sum,cout);
assign sum=a^b^cin;
assign cout=(a&b)|(b&cin)|(cin&a);
endmodule 

module ha(input a,b,output sum,carry);
assign sum=a^b;
assign carry=a&b;
endmodule 
