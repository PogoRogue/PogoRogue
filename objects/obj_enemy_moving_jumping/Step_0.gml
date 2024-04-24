/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

on_ground = place_meeting(x, y + 1, obj_ground_parent);


switch(current_state) {
	case ROBOT_STATES.IDLE:
		if(state_has_changed) {
			sprite_index = spr_walk_enemy_idle_dark;
			alarm_set(2, room_speed / 2);
		}
		
		if(jump_cooldown <= 0 && distance_to_object(player) < range) {
			current_state = ROBOT_STATES.JUMPING;
		}
		
		break;
	case ROBOT_STATES.WALKING:
		if(state_has_changed) {
			sprite_index = spr_walk_enemy_walk_dark;
		}
		
		if(jump_cooldown <= 0 && distance_to_object(player) < range) {
			current_state = ROBOT_STATES.JUMPING;
		}
		
		at_edge = collision_point(x_dir > 0 ? bbox_right : bbox_left, bbox_bottom + 2, obj_ground_parent, true, true) != noone;

		if(at_edge && !place_meeting(x + (walk_speed * x_dir), y + vspeed, obj_ground_parent)) {
			x += walk_speed * x_dir;
		} else {
			while(at_edge && !place_meeting(x + sign(walk_speed * x_dir), y, obj_ground_parent)) {
				x += sign(walk_speed * x_dir);
			}
			x_dir *= -1;
			current_state = ROBOT_STATES.IDLE;
		}
		
		break;
	case ROBOT_STATES.JUMPING:
		if(state_has_changed) {
			sprite_index = spr_walk_enemy_jump;
			image_index = 0;
			alarm_set(1, room_speed);
			has_jumped = false;
		}
		
		if(on_ground) {
			x_dir = x < player.x ? 1 : -1;
			if(has_jumped) {
				current_state = ROBOT_STATES.IDLE;
			}
		} else if(has_jumped) {
			if(!place_meeting(x + (jump_speed * x_dir), y + vspeed, obj_ground_parent)) {
				x += jump_speed * x_dir;
			} else {
				while(!place_meeting(x + sign(jump_speed * x_dir), y, obj_ground_parent)) {
					x += sign(jump_speed * x_dir);
				}
				x_dir *= -0.8;
			}
			image_index = min(image_index, sprite_get_number(spr_walk_enemy_jump) - 1);
		}
		
		break;
}

jump_cooldown = max(jump_cooldown - 1, 0);

image_xscale = x_dir > 0 ? 1 : -1;

state_has_changed = previous_state != current_state;
previous_state = current_state;
