//      https://hdlbits.01xz.net/wiki/Hadd

module top_module( 
    input a, b,
    output cout, sum );
  assign {cout,sum} = a+b;// or sum = a^b,cout = a&b;
endmodule
