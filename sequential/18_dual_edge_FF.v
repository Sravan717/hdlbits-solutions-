//https://hdlbits.01xz.net/wiki/Dualedge

module top_module (
    input clk,
    input d,
    output reg q
);
    reg a,b;
    always@(posedge clk)
        a <=d^b;
    always@(negedge clk)
        b<= d^a;
    assign q= a^b;
 
endmodule
