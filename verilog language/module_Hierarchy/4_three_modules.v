//https://hdlbits.01xz.net/wiki/Module_shift



module top_module ( input clk, input d, output q );
    wire w1,w2;
    my_dff inst1(.clk(clk),.d(d),.q(w1));
    my_dff inst2(.clk(clk),.d(w1),.q(w2));
    my_dff inst3(.clk(clk),.d(w2),.q(q));
    // we can also connect ports by position.

endmodule
