module acc_tb;

reg  [15:0] prod;
reg         en;
reg         clk;
reg         rst;

wire [31:0] acc;


accumulator ACC_inst (.prod(prod), .en(en),.clk(clk),.rst(rst),.acc(acc));




initial begin
    clk = 0;

    forever #5 clk = ~clk;
end


initial begin

    // Initial values
    prod = 0;
    en   = 0;
    rst  = 1;

   
    #20;
    rst = 0;

    // First accumulation
    en   = 1;
    prod = 16'd12; #10;

   

    // Second accumulation
    prod = 16'd10; #10;

   

    // Third accumulation
    prod = 16'd5;  #10;



    // Disabling accumulation
    en   = 0;
    prod = 16'd100; #10;

    

    // Reset again
    rst = 1; #10;
     rst = 0;#10;
     $finish;

end


initial begin

    $dumpfile("acc_tb.vcd");
    $dumpvars(0, acc_tb);

end

initial begin 

    $monitor(
        "Time=%0t | Product=%0d | EN=%b | RST=%b | ACC=%0d",$time,prod,en,rst,acc);

end

endmodule
