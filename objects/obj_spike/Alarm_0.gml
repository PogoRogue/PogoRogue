mask_index = spr_spike_mask_down;

if !place_meeting(x,y+1,obj_ground_parent) {
	if place_meeting(x-1,y,obj_ground) {
		sprite_index = spr_spike_mask_left;	
		mask_index = spr_spike_mask_left;	
	}else if place_meeting(x+1,y,obj_ground) {
		sprite_index = spr_spike_mask_right;	
		mask_index = spr_spike_mask_right;	
	}else {
		sprite_index = spr_spike_mask_up;	
		mask_index = spr_spike_mask_up;	
	}
}