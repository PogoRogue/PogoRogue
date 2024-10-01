#region //angling
key_recenter = global.key_recenter;
var haxis = gamepad_axis_value(0, gp_axislh);
var vaxis = gamepad_axis_value(0, gp_axislv);
if controller_lock_in = false {
	if (can_rotate) {
		if (use_mouse = false) { //use WASD/Arrow Keys to angle player
			if (angle >= -anglemax and key_right and !invert) and !(msk_index.colliding_with_ground_right) and !key_left
			or (angle >= -anglemax and key_left and invert) and !(msk_index.colliding_with_ground_left) and !key_right {
				current_rotation_speed = -rotation_speed;
				temp_rotation_speed = -3;
			}else if (angle <= anglemax and key_left and !invert) and !(msk_index.colliding_with_ground_left) and !key_right
			or (angle <= anglemax and key_right and invert) and !(msk_index.colliding_with_ground_right) and !key_left {
				current_rotation_speed = rotation_speed;
				temp_rotation_speed = 3;
			}else {
			
				if (angle < -anglemax and key_right and !invert) and !(msk_index.colliding_with_ground_right) and !key_left
				or (angle < -anglemax and key_left and invert) and !(msk_index.colliding_with_ground_left) and !key_right {
				
					if (temp_rotation_speed < 0) {
						temp_rotation_speed += temp_rotation_delay;
					}else if (temp_rotation_speed > 0) {
						temp_rotation_speed -= temp_rotation_delay;
					}
					current_rotation_speed = temp_rotation_speed;
				}else if (angle > anglemax and key_left and !invert) and !(msk_index.colliding_with_ground_left) and !key_right
				or (angle > anglemax and key_right and invert) and !(msk_index.colliding_with_ground_right) and !key_left {
				
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
}else if centering = false {
	if can_rotate { 
		var controller_angle = point_direction(0, 0, haxis, vaxis)-90;
		var new_angle = controller_angle/1.5;
		show_debug_message("controller: " + string(controller_angle) + " current angle: " + string(angle));
		var key_left2 = new_angle > angle + (rotation_speed*3);
		var key_right2 = new_angle < angle - (rotation_speed*3);
		if (use_mouse = false) { //use WASD/Arrow Keys to angle player
			if (angle >= -anglemax and key_right2 and !invert) and !(msk_index.colliding_with_ground_right) and !key_left2
			or (angle >= -anglemax and key_left2 and invert) and !(msk_index.colliding_with_ground_left) and !key_left2 {
				current_rotation_speed = -rotation_speed;
				temp_rotation_speed = -3;
			}else if (angle <= anglemax and key_left2 and !invert) and !(msk_index.colliding_with_ground_left) and !key_right2
			or (angle <= anglemax and key_right2 and invert) and !(msk_index.colliding_with_ground_right) and !key_left2 {
				current_rotation_speed = rotation_speed;
				temp_rotation_speed = 3;
			}else {
			
				if (angle < -anglemax and key_right2 and !invert) and !(msk_index.colliding_with_ground_right) and !key_left2
				or (angle < -anglemax and key_left2 and invert) and !(msk_index.colliding_with_ground_left) and !key_right2 {
				
					if (temp_rotation_speed < 0) {
						temp_rotation_speed += temp_rotation_delay;
					}else if (temp_rotation_speed > 0) {
						temp_rotation_speed -= temp_rotation_delay;
					}
					current_rotation_speed = temp_rotation_speed;
				}else if (angle > anglemax and key_left2 and !invert) and !(msk_index.colliding_with_ground_left) and !key_right2
				or (angle > anglemax and key_right2 and invert) and !(msk_index.colliding_with_ground_right) and !key_left2 {
				
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
		
		if abs(new_angle-angle) <= rotation_speed and angle != new_angle {
			//angle = new_angle;
			//current_rotation_speed = 0;
		}
	}
	
}
angle = clamp(angle,-51,51); //cant tilt too far
//show_debug_message(controller_lock_in);


if (abs(haxis) = 1 or abs(vaxis) = 1) and vaxis < 0 {
	//controller_lock_in = true;
}else {
	controller_lock_in = false;
}


//recentering
if key_recenter and centering = false and angle != 0 and !key_left and !key_right and can_rotate {
	centering = true;
}

if (centering = true and can_rotate and controller_lock_in = false or centering = true and state = state_pogosmith) {
	can_rotate = false;
	if angle >= rotation_speed or angle <= -rotation_speed {
		angle += rotation_speed * -sign(angle);
	}else {
		angle = 0;
		can_rotate = true;
		centering = false;
	}
	
	//stop if right or left key
	if !instance_exists(obj_salesman_table) and !instance_exists(obj_pogosmith_table) { 
		if key_left or key_right or state = state_bouncing {
			can_rotate = true;
			centering = false;
		}
	}else {
		if instance_exists(obj_salesman_table) and instance_exists(obj_pogosmith_table) {
			if obj_salesman_table.being_used = false and obj_pogosmith_table.being_used = false {
				if key_left or key_right or state = state_bouncing {
					can_rotate = true;
					centering = false;
				}
			}
		}else if instance_exists(obj_salesman_table) {
			if obj_salesman_table.being_used = false {
				if key_left or key_right or state = state_bouncing {
					can_rotate = true;
					centering = false;
				}
			}
		}else if instance_exists(obj_pogosmith_table) {
			if obj_pogosmith_table.being_used = false {
				if key_left or key_right or state = state_bouncing {
					can_rotate = true;
					centering = false;
				}
			}
		}
	}
}



show_debug_message(angle);