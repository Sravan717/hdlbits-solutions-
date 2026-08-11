//    https://hdlbits.01xz.net/wiki/Module_addsub


module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] c;
    wire x,y;// carry for both adders
    assign c = b^{32{sub}};
    add16 inst1(a[15:0],c[15:0],sub,sum[15:0],x);
    add16 inst2(a[31:16],c[31:16],x,sum[31:16],y);
    

endmodule
