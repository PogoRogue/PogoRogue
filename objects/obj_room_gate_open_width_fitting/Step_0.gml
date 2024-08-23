if closed = false and (obj_player.y < y - 32 or obj_player.x < x and obj_player.y < y or obj_player.x > x + sprite_width and obj_player.y < y) {
	closed = true;	
	mask_index = spr_gate_close_new;
	gate_width = (right_emmiter_pos_x+32) - left_emitter_pos_x;
	gate_width_half = gate_width/2;
	close_distance = gate_width;
}

if closed = true {
	if close_distance > 0 {
		close_distance -= 8;
	}else {
		close_distance = 0;
	}
	if left_emitter_pos_x+gate_width_half-close_distance > left_emitter_pos_x {
		image_index = 1;
	}
}