  // problem link  ... https://hdlbits.01xz.net/wiki/Vector1

module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );
    assign {out_hi,out_lo} = in; // concatenation makes it one line

endmodule
