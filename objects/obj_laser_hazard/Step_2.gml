if instance_exists(parent_index) {
	start_x = parent_index.x + (8*parent_index.image_xscale);
	image_angle = 0;
	start_y = parent_index.y + (6);
	x = start_x+16*sign(image_xscale);
	y = start_y;
}

with parent_index {
	if position_meeting(bbox_left + ((bbox_right-bbox_left)/2),bbox_bottom+2,obj_ground) {
		if image_index = 2 {
			instance_destroy(other);	
		}
	}
}

if spawned = true and instance_exists(parent_index) {
	if xxx != 0 {
		show_debug_message(xxx);
		image_xscale = xxx/16;
	}
}

if spawned = true and place_meeting(x,y,obj_ground) and instance_exists(parent_index) { 
	spawned = false;	
}