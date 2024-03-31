/// @description Insert description here
// You can write your code in this editor

if(instance_exists(controller)) {
	switch(controller.current_state) {
		case BOSS2_STATES.IDLE:
			is_lowering = false;
			break;
		case BOSS2_STATES.VULNERABLE:
			is_lowering = true;
			break;
		case BOSS2_STATES.INACTIVE:
			is_lowering = true;
			break;
	}
}

if(is_lowering) {
	image_yscale -= 0.11;
} else {
	image_yscale += 0.11;
}

image_yscale = clamp(image_yscale, 0.0, initial_scale);

if(place_meeting(x, y, obj_player)) {
	with(obj_player) {
		while(place_meeting(x, y, obj_invisible_floor)) {
			y--;
		}
		speed = 0;
		if(other.image_yscale >= other.initial_scale && state != state_bouncing && state != state_chargejump) {
			state = state_bouncing;
		}
	}
}
