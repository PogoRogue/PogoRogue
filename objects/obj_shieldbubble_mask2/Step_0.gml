//check for collision with ground y axis
if instance_exists(parent_obj) {
	if parent_obj.bouncing = false and parent_obj.not_colliding = true {
		if place_meeting(x,y,obj_ground) 
		or place_meeting(x,y,obj_enemy_parent)  
		or place_meeting(x,y,obj_spike) {
			alarm[0] = 1;
		}
	}
}

if !place_meeting(x,y,obj_ground) and !place_meeting(x,y,obj_enemy_parent) and !place_meeting(x,y,obj_spike) {
	with obj_shieldbubble_mask {
		if !place_meeting(x,y,obj_ground) and !place_meeting(x,y,obj_enemy_parent) and !place_meeting(x,y,obj_spike) {
			parent_obj.not_colliding = true;
			obj_player.state = obj_player.state_shieldbubble;
			obj_player.shield_bubble = true;
		}
	}
}