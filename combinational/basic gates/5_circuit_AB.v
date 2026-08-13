//       https://hdlbits.01xz.net/wiki/Mt2015_q4

module top_module (input x, input y, output z);
    // modules instantiated with same i/p twice
    wire a,b;
    A inst1(x,y,a);
    B inst2(x,y,b);
    assign z = (a|b)^(a&b);    
    

endmodule

module A(input x, input y,output z);
    assign z = x&(x^y);
endmodule
module B(input x, input y ,output z);
    assign z = ~(x^y);
endmodule
