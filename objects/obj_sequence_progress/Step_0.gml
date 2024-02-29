/// @description Insert description here
// You can write your code in this editor

if(instance_exists(controller)) {
	if(controller.sequence_failed = false) {
		if(controller.sequence_length == 2) {
			current_frame = 0;
		} else if(controller.sequence_length == 3) {
			current_frame = 4;
		} else if(controller.sequence_length == 4) {
			current_frame = 9;
		}
		
		if(controller.current_state == STATES.ATTACKING) {
			current_frame += controller.sequence_index;
		} else if(controller.current_state == STATES.VULNERABLE) {
			current_frame += controller.sequence_length;
		}
	} else {
		if(controller.sequence_length == 2) {
			current_frame = 3;
		} else if(controller.sequence_length == 3) {
			current_frame = 8;
		} else if(controller.sequence_length == 4) {
			current_frame = 14;
		}
	}
} else {
	current_frame = 15;
}

image_index = current_frame;
