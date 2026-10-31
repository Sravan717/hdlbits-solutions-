//  https://hdlbits.01xz.net/wiki/Lemmings2

module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
 parameter L=2'd0,f_l = 2'd1,R=2'd2,f_r =2'd3;
    reg [1:0] state,next_state;
    always @(posedge clk or posedge areset) begin
        if(areset)
            state<=L;
        else 
            state<=next_state;
            
    end
    always @(*) begin
        case(state)
            L: next_state = ground?(bump_left?R:L):f_l;
            f_l:next_state = ground?L:f_l;
            R: next_state = ground?(bump_right?L:R):f_r;
            f_r: next_state = ground?R:f_r;
            default:next_state = state;
        endcase
    end
    assign walk_left = (state ==L);
    assign walk_right = (state ==R);
    assign aaah = (state ==f_l || (state ==f_r));
endmodule
