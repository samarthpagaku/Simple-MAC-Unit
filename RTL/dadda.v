module dadda(
    input [7:0]a,b,
    output [15:0]t
);
wire [7:0]p[7:0];
  wire [42:1]s,c;
  wire [16:1]cr;

genvar i,j;
generate 
    for(i=0;i<8;i=i+1) begin: rows 
      for (j=0;j<8;j=j+1)begin:columns 
     assign  p[i][j]=a[i]&b[j];
      end 
    end 
endgenerate
//stage 1
ha h1(p[0][6],p[1][5],s[1],c[1]);
fa f1(p[0][7],p[1][6],p[2][5],s[2],c[2]);
ha h2(p[3][4],p[4][3],s[3],c[3]);
fa f2(p[1][7],p[2][6],p[3][5],s[4],c[4]);
ha h3(p[4][4],p[5][3],s[5],c[5]);
fa f3(p[2][7],p[3][6],p[4][5],s[6],c[6]);
//stage 2 
ha h4(p[0][4],p[1][3],s[7],c[7]);
fa f4(p[0][5],p[1][4],p[2][3],s[8],c[8]);
ha h5(p[3][2],p[4][1],s[9],c[9]);
fa f5(s[1],p[2][4],p[3][3],s[10],c[10]);
fa f6(p[4][2],p[5][1],p[6][0],s[11],c[11]);
fa f7(c[1],s[2],s[3],s[12],c[12]);
fa f8(p[5][2],p[6][1],p[7][0],s[13],c[13]);
fa f9(c[2],c[3],s[4],s[14],c[14]);
fa f10(s[5],p[6][2],p[7][1],s[15],c[15]);
fa f11(c[4],c[5],s[6],s[16],c[16]);
fa f12(p[5][4],p[6][3],p[7][2],s[17],c[17]);
fa f13(c[6],p[3][7],p[4][6],s[18],c[18]);
fa f14(p[5][5],p[6][4],p[7][3],s[19],c[19]);
fa f15(p[4][7],p[5][6],p[6][5],s[20],c[20]);
//stage 3
ha h6(p[0][2],p[1][2],s[21],c[21]);
fa f16(s[7],p[2][2],p[3][1],s[22],c[22]);
fa f17(c[7],s[8],s[9],s[23],c[23]);
fa f18(c[8],c[9],s[10],s[24],c[24]);
fa f19(c[10],c[11],s[12],s[25],c[25]);
fa f20(c[12],c[13],s[14],s[26],c[26]);
fa f21(c[14],c[15],s[16],s[27],c[27]);
fa f22(c[16],c[17],s[18],s[28],c[28]);
fa f23(c[18],c[19],s[20],s[29],c[29]);
fa f24(c[20],p[5][7],p[6][6],s[30],c[30]);
//stage 4
ha h7(p[0][2],p[1][1],s[31],c[31]);
fa f25(s[21],p[2][1],p[3][0],s[32],c[32]);
fa f26(c[21],s[22],p[4][0],s[33],c[33]);
fa f27(c[22],s[23],p[5][0],s[34],c[34]);
fa f28(c[23],s[24],s[11],s[35],c[35]);
fa f29(c[24],s[25],s[13],s[36],c[36]);
fa f30(c[25],s[26],s[15],s[37],c[37]);
fa f31(c[26],s[27],s[17],s[38],c[38]);
fa f32(c[27],s[28],s[19],s[39],c[39]);
fa f33(c[28],s[29],p[7][4],s[40],c[40]);
fa f34(c[29],s[30],p[7][5],s[41],c[41]);
fa f35(c[30],p[6][7],p[7][6],s[42],c[42]);

//final stage 
assign t[0]=p[0][0];
ha h8(p[0][1],p[1][0],t[1],cr[1]);
fa f36(cr[1],s[31],p[2][0],t[2],cr[2]);
fa f37(cr[2],c[31],s[32],t[3],cr[3]);
fa f38(c[32],s[33],cr[3],t[4],cr[4]);
fa f39(cr[4],c[33],s[34],t[5],cr[5]);
fa f40(cr[5],c[34],s[35],t[6],cr[6]);
fa f41(cr[6],c[35],s[36],t[7],cr[7]);
fa f42(cr[7],c[36],s[37],t[8],cr[8]);
fa f43(cr[8],c[37],s[38],t[9],cr[9]);
fa f44(cr[9],c[38],s[39],t[10],cr[10]);
fa f45(cr[10],c[39],s[40],t[11],cr[11]);
fa f46(cr[11],c[40],s[41],t[12],cr[12]);
fa f47(cr[12],c[41],s[42],t[13],cr[13]);
fa f48(cr[13],p[7][7],c[42],t[14],t[15]);
endmodule 

module fa(input a,b,cin,output sum,cout);
assign sum=a^b^cin;
assign cout=(a&b)|(b&cin)|(cin&a);
endmodule 

module ha(input a,b,output sum,carry);
assign sum=a^b;
assign carry=a&b;
endmodule 
