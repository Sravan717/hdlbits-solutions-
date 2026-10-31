//   https://hdlbits.01xz.net/wiki/Exams/ece241_2013_q4

module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    reg [2:0] state,next_state;
  parameter A0 = 3'd0, A1 = 3'd1,A2= 3'd2,A3=3'd3,A4=3'd4,A5=3'd5;
    always @(posedge clk)begin
        if(reset)
            state <= A0;
        else
            state <=next_state; 
    end
  always @(*) begin // state transition logic
      // better to use state for case
      
        case(s)
            : next_state =A0;
            3'b001:begin
                if (state == A0)
                    next_state = A1;
                else if(state == A3||state == A4||state == A5)
                    next_state = A2;
                else
                    next_state = state;
                
            end
            3'b011:begin
                if (state == A5)
                    next_state = A4;
                else if(state == A0||state == A1||state == A2)
                    next_state = A3;
                else
                    next_state = state;
            end
            3'b111: next_state =A5;
            default: next_state = state;
            
        endcase
            
    end
  // here we can use case (state) too
    assign fr3 = (state == A0);
    assign fr2 = (state == A0|state == A1|state ==A2);
    assign fr1 = (state !=A5);
    assign dfr = ( state == A2|state ==A4|state == A0);
   
endmodule
