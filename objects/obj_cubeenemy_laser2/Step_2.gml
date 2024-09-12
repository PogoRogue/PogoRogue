if instance_exists(parent_index) {
	if floor(parent_index.image_index) = 0 {
		start_x = parent_index.x - (20 * parent_index.image_xscale);
		start_y = parent_index.y + 12;
		image_angle = 270;
		x = start_x;
		y = start_y+16;
	}else if floor(parent_index.image_index) = 1 {
		if parent_index.image_xscale = 1 {
			start_x = parent_index.x - (52);
			image_angle = 180;
		}else {
			start_x = parent_index.x - (12);
			image_angle = 180;
		}
		start_y = parent_index.y - 20;
		
		x = start_x-16;
		y = start_y;
	}else if floor(parent_index.image_index) = 2 {
		start_x = parent_index.x - (20 * parent_index.image_xscale);
		start_y = parent_index.y - 52;
		image_angle = 90;
		x = start_x;
		y = start_y-16;
	}else if floor(parent_index.image_index) = 3 {
		if parent_index.image_xscale = 1 {
			start_x = parent_index.x + (12);
			image_angle = 0;
		}else {
			start_x = parent_index.x + (52);
			image_angle = 0;
		}
		
		start_y = parent_index.y - 20;
		x = start_x+16;
		y = start_y;
	}
}

with parent_index {
	if position_meeting(bbox_left + ((bbox_right-bbox_left)/2),bbox_bottom+2,obj_ground) {
		if image_index = 0 {
			instance_destroy(other);	
		}
	}
}

if spawned = true and instance_exists(parent_index) {
	while !place_meeting(x,y,obj_ground) {
		image_xscale += 1/16;
		if abs(image_xscale) > 96 {
			break;
		}
	}
}

if spawned = true and place_meeting(x,y,obj_ground) and instance_exists(parent_index) { 
	spawned = false;	
}