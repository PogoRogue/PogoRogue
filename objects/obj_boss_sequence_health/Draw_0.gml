/// @description Fill healthbar

draw_sprite(spr_boss_health_back, 0, x, y);

var _sprite_to_draw = controller.current_state == BOSS2_STATES.VULNERABLE ? spr_boss_health_segment : spr_boss_health_segment_inactive;

var _x = x;
for(; _x < x + num_segments; _x+=4) {
	draw_sprite(_sprite_to_draw, 0, _x, y);
}

if(num_segments > 0 && num_segments < total_spaces && controller.current_state == BOSS2_STATES.VULNERABLE) {
	draw_sprite(spr_boss_health_segment_end, 0, _x, y);
}

draw_self();