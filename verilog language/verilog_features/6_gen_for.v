//  https://hdlbits.01xz.net/wiki/Adder100i


module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    wire [100:0] c;
    assign c[0] = cin;
     genvar i;
    generate
       
        for(i=0;i<100;i++) begin: loop
            add inst(a[i],b[i],c[i],sum[i],c[i+1]);
            
        end
        
    endgenerate  
    
    assign cout = c[100:1];
    
endmodule

module add(input x,input y, input z ,output s, output ca);
    
    assign  { ca,s} = x+y+z;
endmodule
