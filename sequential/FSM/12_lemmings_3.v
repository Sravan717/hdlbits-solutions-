//https://hdlbits.01xz.net/wiki/Lemmings3


module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
   parameter L=3'd0,f_l = 3'd1,R=3'd2,f_r =3'd3,d_l=3'd4,d_r=3'd5;
    reg [2:0] state,next_state;
    always @(posedge clk or posedge areset) begin
        if(areset)
            state<=L;
        else 
            state<=next_state;
            
    end
    always @(*) begin
        case(state)
            L: next_state = ground?(dig?d_l:(bump_left?R:L)):f_l;
            f_l:next_state = ground?L:f_l;
            R: next_state = ground?(dig?d_r:(bump_right?L:R)):f_r;
            f_r: next_state = ground?R:f_r;
            d_l: next_state = ground?d_l:f_l;
            d_r:next_state = ground?d_r:f_r;
            default:next_state = state;
        endcase
    end
    assign walk_left = (state ==L);
    assign walk_right = (state ==R);
    assign aaah = (state ==f_l || (state ==f_r));
    assign digging = (state==d_l)||(state==d_r);
endmodule

