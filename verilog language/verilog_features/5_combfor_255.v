//  https://hdlbits.01xz.net/wiki/Popcount255

module top_module( 
    input [254:0] in,
    output reg [7:0] out );
    
    always @(*) begin
        out = 0;
        for(integer i=0;i<255;i++)begin
             
            out = in[i]?(out+1'b1):out;  // or simply out = out +in[i]
            
        end
        
    end

    
    
endmodule
