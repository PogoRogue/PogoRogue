/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch(current_state) {
	case ROBOT_STATES.IDLE:
		if(state_has_changed) {
			sprite_index = spr_walk_enemy_idle;
			alarm_set(2, room_speed / 2);
		}
		
		break;
	case ROBOT_STATES.WALKING:
		if(state_has_changed) {
			sprite_index = spr_walk_enemy_walk;
		}
		
		if !position_meeting(bbox_right,bbox_bottom+2,obj_ground) and !position_meeting(bbox_right,bbox_bottom+2,obj_ground_oneway) and x_dir = 1 
		or x_dir = 1 and place_meeting(x+(walk_speed * x_dir),y,obj_ground) {
			x_dir *= -1;
			current_state = ROBOT_STATES.IDLE;
		}else if !position_meeting(bbox_left,bbox_bottom+2,obj_ground) and !position_meeting(bbox_left,bbox_bottom+2,obj_ground_oneway) and x_dir = -1 
		or x_dir = -11 and place_meeting(x+(walk_speed * x_dir),y,obj_ground) {
			x_dir *= -1;
			current_state = ROBOT_STATES.IDLE;
		}else if !is_dead and !red_frames > 0 {
			x += walk_speed * x_dir;	
		}

		
		/*at_edge = (collision_point(x_dir > 0 ? bbox_right : bbox_left, bbox_bottom + 2, obj_ground, true, true) != noone) or (collision_point(x_dir > 0 ? bbox_right : bbox_left, bbox_bottom + 2, obj_ground_oneway, true, true) != noone);

		if(at_edge && !place_meeting(x + (walk_speed * x_dir), y + vspeed, obj_ground) && !place_meeting(x + (walk_speed * x_dir), y + vspeed, obj_ground_oneway)) and hp > 0 {
			x += walk_speed * x_dir;
		} else if hp > 0 {
			while(at_edge && !place_meeting(x + sign(walk_speed * x_dir), y, obj_ground) && !place_meeting(x + sign(walk_speed * x_dir), y, obj_ground_oneway)) {
				x += sign(walk_speed * x_dir);
			}
			x_dir *= -1;
			current_state = ROBOT_STATES.IDLE;
		}*/
		
		break;
}

image_xscale = x_dir > 0 ? 1 : -1;

state_has_changed = previous_state != current_state;
previous_state = current_state;
