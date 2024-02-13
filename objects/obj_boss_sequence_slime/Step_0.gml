/// @description 

if(instance_exists(controller)) {
	switch(controller.current_state) {
		case STATES.IDLE:
			if(current_sprite == spr_boss2_slime_drain) {
				image_index = 0;
			}
			current_sprite = spr_boss2_slime_raise;
			break;
		case STATES.VULNERABLE:
			if(current_sprite == spr_boss2_slime_raise) {
				image_index = 0;
			}
			current_sprite = spr_boss2_slime_drain;
			break;
		case STATES.DEAD:
			if(current_sprite == spr_boss2_slime_raise) {
				image_index = 0;
			}
			current_sprite = spr_boss2_slime_drain;
			break;
	}
}

sprite_index = current_sprite;
image_index = min(image_index, sprite_get_number(current_sprite) - 1);
