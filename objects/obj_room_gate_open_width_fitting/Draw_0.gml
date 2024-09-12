if closed = true {
	draw_sprite(spr_gate_left,0,left_emitter_pos_x+gate_width_half-close_distance,y);
	draw_sprite(spr_gate_right,0,left_emitter_pos_x+gate_width_half+close_distance,y);
}

draw_self();
draw_sprite(spr_gate_open_left, image_index, left_emitter_pos_x, y);
draw_sprite(spr_gate_open_right, image_index, right_emmiter_pos_x, y);
draw_sprite(spr_gate_open_middle, 0, middle_symbol_pos_x, y);