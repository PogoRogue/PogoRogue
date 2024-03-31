/// @description Fill healthbar

draw_sprite(spr_boss_health_back, 0, x, y);

var _sprite_to_draw = controller.current_state == BOSS2_STATES.VULNERABLE ? spr_boss_health_segment : spr_boss_health_segment_inactive;

for(var _x = x; _x < x + num_segments; _x++) {
	draw_sprite(_sprite_to_draw, 0, _x, y);
}

draw_self();
