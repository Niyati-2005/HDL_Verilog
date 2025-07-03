//verilog code:
module ArithmeticCkt_4bit(D,Cout,Cin,S,A,B);
input [3:0]A,B;
input [1:0]S;
input Cin;
output Cout;
output [3:0]D;
wire [3:0]Ymux;
wire [3:1]C;
wire [3:0]Bnot;
not n1(Bnot[0],B[0]),
    n2(Bnot[1],B[1]),
    n3(Bnot[2],B[2]),
    n4(Bnot[3],B[3]);

Mux4_1 m1(Ymux[0],S,B[0],Bnot[0],1'b0,1'b1),
       m2(Ymux[1],S,B[1],Bnot[1],1'b0,1'b1),
       m3(Ymux[2],S,B[2],Bnot[2],1'b0,1'b1),
       m4(Ymux[3],S,B[3],Bnot[3],1'b0,1'b1);
       
Full_Adder fa1(A[0],Ymux[0],Cin,D[0],C[1]),
           fa2(A[1],Ymux[1],C[1],D[1],C[2]),
           fa3(A[2],Ymux[2],C[2],D[2],C[3]),
           fa4(A[3],Ymux[3],C[3],D[3],Cout);
endmodule


module Mux4_1(Y,S,A[0],A[1],A[2],A[3]);
input [3:0]A;
input [1:0]S;
output Y;
assign Y=S[0]?(S[1]?A[3]:A[1]):(S[1]?A[2]:A[0]);
endmodule

module Full_Adder(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
    );
    assign Sum = A ^ B ^ Cin;
    assign Cout = (A & B) | (Cin & (A ^ B));
endmodule

