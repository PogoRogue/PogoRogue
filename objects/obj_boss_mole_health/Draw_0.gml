/// @description Fill healthbar

var _x = x;
for(; _x < x + num_segments1; _x+=4) {
	if _x < x + fragments_num {
		draw_sprite(spr_boss_health_segment, 0, _x, y);
	}
}

var _x2 = x2;
for(; _x2 < x2 + num_segments2; _x2+=4) {
	if _x2 < x2 + fragments_num {
		draw_sprite(spr_boss_health_segment, 0, _x2, y);
	}
}

var _x3 = x3;
for(; _x3 < x3 + num_segments3; _x3+=4) {
	if _x3 < x3 + fragments_num {
		draw_sprite(spr_boss_health_segment, 0, _x3, y);
	}
}

if(num_segments1 > 0 && num_segments1 < total_spaces) {
	draw_sprite(spr_boss_health_segment_end, 0, _x, y);
}

if(num_segments2 > 0 && num_segments2 < total_spaces) {
	draw_sprite(spr_boss_health_segment_end, 0, _x2, y);
}

if(num_segments3 > 0 && num_segments3 < total_spaces) {
	draw_sprite(spr_boss_health_segment_end, 0, _x3, y);
}

draw_sprite(spr_boss_health_outline_mole, 0, view_x + 71, view_y + view_height - 20);
draw_sprite(spr_boss_health_outline_mole, 0, view_x + 75 + 192 + 32, view_y + view_height - 20);
draw_sprite(spr_boss_health_outline_mole, 0, view_x + 75 + 192 + 192 + 64, view_y + view_height - 20);


draw_sprite(spr_mole_icon,0 + ((!instance_exists(obj_boss_mole1) or instance_exists(obj_boss_mole1) and obj_boss_mole1.is_dead = true) * 3),view_x + 66,view_y + view_height - 17);
draw_sprite(spr_mole_icon,1 + ((!instance_exists(obj_boss_mole2) or instance_exists(obj_boss_mole2) and obj_boss_mole2.is_dead = true) * 3),view_x + 66 + 192 + 32,view_y + view_height - 17);
draw_sprite(spr_mole_icon,2 + ((!instance_exists(obj_boss_mole3) or instance_exists(obj_boss_mole3) and obj_boss_mole3.is_dead = true) * 3),view_x + 66 + 192 + 192 + 64,view_y + view_height - 17);