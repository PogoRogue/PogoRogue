/// @description Override

// Do nothing{
if scr_Animation_Complete() and opened = false {
	image_speed = 0;	
	opened = true;
}

if opened = true {
	if closed = false and (obj_player.y < y - 32) {
		closed = true;	
		image_speed = -1;
		mask_index = spr_gate_close_new;
	}

	if floor(image_index) <= 1 and image_speed = -1 {
		image_index = 0;
		image_speed = 0;
	}
}