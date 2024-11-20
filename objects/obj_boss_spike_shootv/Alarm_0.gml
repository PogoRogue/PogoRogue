if instance_exists(parent_index) {	
	if image_index = 0 {
		new_direction = image_angle+90;
	}else if image_index = 1 {
		new_direction = image_angle + 30;
	}else if image_index = 2 {
		new_direction = image_angle + 330;
	}else if image_index = 3 {
		new_direction = image_angle + 270;
	}else if image_index = 4 {
		new_direction = image_angle + 210;
	}else if image_index = 5 {
		new_direction = image_angle + 150;
	}
}
direction_set = true;
//speed = 6;