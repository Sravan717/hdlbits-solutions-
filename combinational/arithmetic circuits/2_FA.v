//      https://hdlbits.01xz.net/wiki/Fadd

module top_module( 
    input a, b, cin,
    output cout, sum );
  assign {cout,sum} = a+b+cin; // sum = a^b^cin, cout = a&b | cin&(a^b)
endmodule
