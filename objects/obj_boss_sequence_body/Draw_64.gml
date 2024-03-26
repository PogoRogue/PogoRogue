/// @description Draw health bar

hp_percent = (hp / hp_max) * 100;
if(controller.current_state == STATES.VULNERABLE) {
	draw_healthbar(left_border, top_border, right_border, bottom_border, hp / hp_max * 100, #212123, hp_color_vulnerable, hp_color_vulnerable, 0, true, true);
} else { 
	draw_healthbar(left_border, top_border, right_border, bottom_border, hp / hp_max * 100, #212123, hp_color_invulnerable, hp_color_invulnerable, 0, true, true);
}

draw_line_width_color(left_segment, top_border - 1, left_segment, bottom_border, 2, #888888, #666666);
draw_line_width_color(right_segment, top_border - 1, right_segment, bottom_border, 2, #888888, #666666);
