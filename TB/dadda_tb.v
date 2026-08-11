module dadda_tb;
reg [7:0]a,b;
wire [15:0]t;


dadda M_inst(.a(a),.b(b),.t(t));

initial begin
     a=8'b10101010 ;b =8'b11111111;
 #50 a=8'b11110000 ;b =8'b00001111;
 #50 a=8'b11001100 ;b =8'b00110011;    
 #50 $finish;
 end 

 initial begin
      $dumpfile("dadda_mul.vcd");
      $dumpvars (0,dadda_tb);
      end 

 initial begin 
   $monitor("Time=%0t | A=%0d | B=%0d | Product=%0d",$time, a, b, t);

 end 
endmodule
