//  https://hdlbits.01xz.net/wiki/Lemmings4

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
   parameter L=3'd0,f_l = 3'd1,R=3'd2,f_r =3'd3,d_l=3'd4,d_r=3'd5,splat =3'd6;
    reg [2:0] state,next_state;
    reg [7:0] count;
    always @(posedge clk or posedge areset) begin
        if(areset)begin
            state<=L;
            count <=8'b0;
        end
        else begin
            state<=next_state;
            if(next_state== f_l || next_state==f_r)begin
                if( count<8'd21)
                    count <= count+1'b1;
            end 
            else
                count <= 1'b0;
        end
            
    end
    always @(*) begin
        case(state)
            L: next_state = ground?(dig?d_l:(bump_left?R:L)):f_l;
            f_l:next_state = ground?((count>8'd20)?splat:L):f_l;
            R: next_state = ground?(dig?d_r:(bump_right?L:R)):f_r;
            f_r: next_state = ground?((count>8'd20)?splat:R):f_r;
            d_l: next_state = ground?d_l:f_l;
            d_r:next_state = ground?d_r:f_r;
            splat:next_state=splat;
            default:next_state = state;
        endcase
    end
    assign walk_left = (state ==L);
    assign walk_right = (state ==R);
    assign aaah = (state ==f_l || (state ==f_r));
    assign digging = (state==d_l)||(state==d_r);
endmodule
