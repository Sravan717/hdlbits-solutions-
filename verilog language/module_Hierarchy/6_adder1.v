//  https://hdlbits.01xz.net/wiki/Module_add

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire c;  // carry wire
    add16 inst1(a[15:0],b[15:0],1'b0,sum[15:0],c);
    add16 inst2(a[31:16],b[31:16],c,sum[31:16]);// ignoring cout

endmodule
