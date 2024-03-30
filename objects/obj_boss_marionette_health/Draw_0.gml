/// @description Fill healthbar

draw_sprite(spr_boss_health_back, 0, x, y);

for(var _x = x; _x < x + num_segments; _x++) {
	draw_sprite(spr_boss_health_segment, 0, _x, y);
}

draw_self();
