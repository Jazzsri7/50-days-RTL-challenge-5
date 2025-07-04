module array_multiplier(input  [3:0] A, B,
						output [7:0] P);
						
    wire [3:0] pp0, pp1, pp2, pp3;
    wire s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11;
    wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11;

    assign pp0 = A&{4{B[0]}};
    assign pp1 = A&{4{B[1]}};
    assign pp2 = A&{4{B[2]}};
    assign pp3 = A&{4{B[3]}};

    assign P[0] =pp0[0];
    half_adder ha1(pp0[1],pp1[0],s1,c1);
    full_adder fa1(pp0[2],pp1[1],c1,s2,c2);
    full_adder fa2(pp0[3],pp1[2],c2,s3,c3);

    full_adder fa3(s2,pp2[0],1'b0,s4,c4);
    full_adder fa4(s3,pp2[1],c4,s5,c5);
    full_adder fa5(pp1[3],pp2[2],c5,s6,c6);
    full_adder fa6(pp2[3],c3,c6,s7,c7);

    full_adder fa7(s5,pp3[0],1'b0,s8,c8);
    full_adder fa8(s6,pp3[1],c8,s9,c9);
    full_adder fa9(s7,pp3[2],c9,s10,c10);
    full_adder fa10(pp3[3],c7,c10,s11,c11);

    assign P[1]=s1;
    assign P[2]=s4;
    assign P[3]=s8;
    assign P[4]=s9;
    assign P[5]=s10;
    assign P[6]=s11;
    assign P[7]=c11;
	
endmodule


module half_adder(input a,b, 
                  output sum,carry);
    assign sum=a^b;
    assign carry=a&b;
endmodule

module full_adder(input a,b,cin,
                  output sum,carry);
    assign sum=a^b^cin;
  assign carry=(a&b)|(b&cin)|(a&cin);
endmodule
