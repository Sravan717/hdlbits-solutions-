//      https://hdlbits.01xz.net/wiki/Bcdadd4

module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire [4:0] c;
    assign c[0] = cin;
    genvar i;
    generate
        for(i=0;i<4;i++) begin: loopq
            bcd_fadd inst(a[4*i+3 -:4],b[4*i+3 -:4],c[i],c[i+1],sum[4*i+3 -:4]);
        end
    endgenerate
    assign cout = c[4];
endmodule
