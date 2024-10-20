/// @description Update camera

//Update destination
if (instance_exists(follow)) {
	//update destination
	xTo = follow.x;
	yTo = follow.y - 48;
	
	if room = room_gameplay_video or room = room_boss_1 {
		var hallway_w_half = 280;
		var hallway_h_half = 176;
	}else {
		var hallway_w_half = 256;
		var hallway_h_half = 176;
	}
	
	x_min = xTo;
	x_max = xTo;
	y_min = yTo;
	y_max = yTo;
	
	x_clamp = false;
	y_clamp = false;
	
	var follow_x = follow.x+lengthdir_x(21,follow.angle+90);
	var follow_y = follow.y+lengthdir_y(21,follow.angle+90);
	
	if room != room_tutorial {
		var check_distance = 2;	
	}else {
		var check_distance = 1.5;	
	}
	
	//constrain camera in hallways
	if collision_line(follow_x,follow_y,follow_x-hallway_w_half*check_distance,follow_y,obj_camera_constrain_x_left,false,true) != noone 
	and collision_line(follow_x,follow_y,follow_x+hallway_w_half*check_distance,follow_y,obj_camera_constrain_x_right,false,true) != noone {
		x_min = collision_line(follow_x,follow_y,follow_x-hallway_w_half*check_distance,follow_y,obj_camera_constrain_x_left,false,true).x+hallway_w_half;
		x_max = collision_line(follow_x,follow_y,follow_x+hallway_w_half*check_distance,follow_y,obj_camera_constrain_x_right,false,true).x-hallway_w_half;
		x_clamp = true;
	}else if collision_line(follow_x,follow_y,follow_x-hallway_w_half*check_distance,follow_y,obj_camera_constrain_x_left,false,true) != noone { //only left
		x_min = collision_line(follow_x,follow_y,follow_x-hallway_w_half*check_distance,follow_y,obj_camera_constrain_x_left,false,true).x+hallway_w_half;
		x_max = max(xTo,x_min);
		x_clamp = true;
	}else if collision_line(follow_x,follow_y,follow_x+hallway_w_half*check_distance,follow_y,obj_camera_constrain_x_right,false,true) != noone { //only right
		x_max = collision_line(follow_x,follow_y,follow_x+hallway_w_half*check_distance,follow_y,obj_camera_constrain_x_right,false,true).x-hallway_w_half;
		x_min = min(xTo,x_max);
		x_clamp = true;
	}else {
		x_min = xTo;
		x_max = xTo;
		x_clamp = false;
	}
	if collision_line(follow_x,follow_y,follow_x,follow_y-hallway_h_half*check_distance,obj_camera_constrain_y_top,false,true) != noone 
	and collision_line(follow_x,follow_y,follow_x,follow_y+hallway_h_half*check_distance,obj_camera_constrain_y_bottom,false,true) != noone {
		y_min = collision_line(follow_x,follow_y,follow_x,follow_y-hallway_h_half*check_distance,obj_camera_constrain_y_top,false,true).y+hallway_h_half;
		y_max = collision_line(follow_x,follow_y,follow_x,follow_y+hallway_h_half*check_distance,obj_camera_constrain_y_bottom,false,true).y-hallway_h_half;
		y_clamp = true;
	}else if collision_line(follow_x,follow_y,follow_x,follow_y-hallway_h_half*check_distance,obj_camera_constrain_y_top,false,true) != noone { //only top
		y_min = collision_line(follow_x,follow_y,follow_x,follow_y-hallway_h_half*check_distance,obj_camera_constrain_y_top,false,true).y+hallway_h_half;
		y_max = max(yTo,y_min);
		y_clamp = true;
	}else if collision_line(follow_x,follow_y,follow_x,follow_y+hallway_h_half*check_distance,obj_camera_constrain_y_bottom,false,true) != noone { //only bottom
		y_max = collision_line(follow_x,follow_y,follow_x,follow_y+hallway_h_half*check_distance,obj_camera_constrain_y_bottom,false,true).y-hallway_h_half;
		y_min = min(yTo,y_max);
		y_clamp = true;
	}else {
		y_min = yTo;
		y_max = yTo;
		y_clamp = false;
	}
	
	if x_clamp {
		var xTo2 = clamp(xTo,x_min,x_max);
		x += (xTo2 - x) / readjust_speed;
	}else {
		x += (xTo - x) / readjust_speed;
	}
	if y_clamp {
		var yTo2 = clamp(yTo,y_min,y_max);
		y += (yTo2 - y) / readjust_speed;
	}else {
		y += (yTo - y) / readjust_speed;
	}
	
	//center in room (unless proc gen level)
	if (room != room_proc_gen_test && room != room_sprite_level_test) {
		x = clamp(x,view_w_half+buff,room_width - view_w_half-buff);
		y = clamp(y,view_h_half+buff,room_height - view_h_half-buff);
	}
}

//screen shake
if (global.allow_screenshake) {
	randomize();
	x += random_range(-shake_remain,shake_remain);
	y += random_range(-shake_remain,shake_remain);
	shake_remain = max(0,(shake_remain-((1/shake_length)*shake_magnitude)));
	shake_remain_controller = max(0,(shake_remain_controller-((1/shake_length_controller)*shake_magnitude_controller)));

	//vibrate controller
	gamepad_set_vibration(0, (shake_remain_controller/4), (shake_remain_controller/4));
	random_set_seed(global.seed);

}else {
	//vibrate controller
	gamepad_set_vibration(0, 0, 0);	
}

//update camera view
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);

