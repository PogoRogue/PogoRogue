#region //angling
if (can_rotate) {
	if (use_mouse = false) { //use WASD/Arrow Keys to angle player
		if (angle >= -anglemax and key_right and !invert) and !(msk_index.colliding_with_ground_right)
		or (angle >= -anglemax and key_left and invert) and !(msk_index.colliding_with_ground_left) {
			current_rotation_speed = -rotation_speed;
			temp_rotation_speed = -3;
		}else if (angle <= anglemax and key_left and !invert) and !(msk_index.colliding_with_ground_left) 
		or (angle <= anglemax and key_right and invert) and !(msk_index.colliding_with_ground_right) {
			current_rotation_speed = rotation_speed;
			temp_rotation_speed = 3;
		}else {
			
			if (angle < -anglemax and key_right and !invert) and !(msk_index.colliding_with_ground_right)
			or (angle < -anglemax and key_left and invert) and !(msk_index.colliding_with_ground_left) {
				
				if (temp_rotation_speed < 0) {
					temp_rotation_speed += temp_rotation_delay;
				}else if (temp_rotation_speed > 0) {
					temp_rotation_speed -= temp_rotation_delay;
				}
				current_rotation_speed = temp_rotation_speed;
			}else if (angle > anglemax and key_left and !invert) and !(msk_index.colliding_with_ground_left) 
			or (angle > anglemax and key_right and invert) and !(msk_index.colliding_with_ground_right) {
				
				if (temp_rotation_speed > 0) {
					temp_rotation_speed -= temp_rotation_delay;
				}else if (temp_rotation_speed < 0) {
					temp_rotation_speed += temp_rotation_delay;
				}
				current_rotation_speed = temp_rotation_speed;
			}else {
			
				if (current_rotation_speed > 0) {
					current_rotation_speed -= rotation_delay;
				}else if (current_rotation_speed < 0) {
					current_rotation_speed += rotation_delay;
				}
				
				if current_rotation_speed <= 0.2 or current_rotation_speed >= -0.2 {
					current_rotation_speed = 0;
				}
			
			}
		}
		angle += current_rotation_speed;
		
	
		if hspeed > 0.5 {
			image_xscale = 1;
		}else if hspeed < -0.5 {
			image_xscale = -1;
		}
		
		
	
	}else if (dead = false) { //use mouse to angle player
	
			if invert = false {
				if (angle <= point_direction(obj_camera.x,y,mouse_x,y-mouse_sensitivity) - 90) {
					angle += ((point_direction(obj_camera.x,y,mouse_x,y-mouse_sensitivity) - 90)-angle)/mouse_reanglespeed;
				}else if (angle >= point_direction(obj_camera.x,y,mouse_x,y-mouse_sensitivity) - 90) {
					angle += ((point_direction(obj_camera.x,y,mouse_x,y-mouse_sensitivity) - 90)-angle)/mouse_reanglespeed;
				}
			}else{
				if (angle <= point_direction(obj_camera.x,y,obj_camera.x - (mouse_x-obj_camera.x),y-mouse_sensitivity) - 90) {
					angle += ((point_direction(obj_camera.x,y,obj_camera.x - (mouse_x-obj_camera.x),y-mouse_sensitivity) - 90)-angle)/mouse_reanglespeed;
				}else if (angle >= point_direction(obj_camera.x,y,obj_camera.x - (mouse_x-obj_camera.x),y-mouse_sensitivity) - 90) {
					angle += ((point_direction(obj_camera.x,y,obj_camera.x - (mouse_x-obj_camera.x),y-mouse_sensitivity) - 90)-angle)/mouse_reanglespeed;
				}
			}
	}
}
angle = clamp(angle,-51,51); //cant tilt too far
show_debug_message(angle);