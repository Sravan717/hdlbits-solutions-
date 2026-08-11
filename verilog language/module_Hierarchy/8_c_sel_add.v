// https://hdlbits.01xz.net/wiki/Module_cseladd

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire x,p,q;
    wire [15:0] y,z;
    
    add16 inst1(a[15:0],b[15:0],1'b0,sum[15:0],x);
    add16 inst2(a[31:16],b[31:16],1'b0,y,p);
    add16 inst3(a[31:16],b[31:16],1'b1,z,q);
    assign sum[31:16] = x?z:y;

endmodule
