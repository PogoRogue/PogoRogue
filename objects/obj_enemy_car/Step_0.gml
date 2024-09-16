/// @description Handle movement

// Inherit the parent event
event_inherited();

if(is_dead) {
	current_state = CAR_STATES.IDLE;
}

switch(current_state) {
	case CAR_STATES.IDLE:
		if(state_has_changed) {
			alarm_set(2, room_speed / 2);
		}
		image_index = 0;
		
		break;
	case CAR_STATES.DRIVING:
		at_edge = collision_point(x_dir > 0 ? bbox_right : bbox_left, bbox_bottom + 2, obj_ground_parent, true, true) != noone;

		if(at_edge && !place_meeting(x + (spd * x_dir), y + vspeed, obj_ground)) {
			x += spd * x_dir;
		} else {
			while(at_edge && !place_meeting(x + sign(spd * x_dir), y, obj_ground)) {
				x += sign(spd * x_dir);
			}
			x_dir *= -1;
			current_state = CAR_STATES.IDLE;
		}
		
		break;
}

image_xscale = x_dir > 0 ? 1 : -1;

state_has_changed = previous_state != current_state;
previous_state = current_state;
