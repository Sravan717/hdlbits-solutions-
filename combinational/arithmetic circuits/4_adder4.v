//          https://hdlbits.01xz.net/wiki/Exams/m2014_q4j


module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
   assign sum = x+y;//  carry will be included in 5th bit , but concatenation operator discards carry bit.
endmodule
