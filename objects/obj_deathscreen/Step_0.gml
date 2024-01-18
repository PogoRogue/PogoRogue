key_left = global.key_left_menu;
key_right = global.key_right_menu;
key_select = global.key_select;

if instance_exists(obj_camera) {
	var distance = distance_to_point(obj_camera.x, obj_camera.y);

	if(distance <= 100){
		spd_multiply = distance / 100;
	}
	
	if y < obj_camera.y {
		y += spd * spd_multiply;
	}
	
	if y >= obj_camera.y and centered = false {
		y = obj_camera.y;
		centered = true;
		select_x = 1;
	}
}

if centered = true {
	//left/right
	if key_left and select_x > 1 and selected_x = false {
		select_x -= 1;
		selected_x = true;
	}
	if key_right and select_x < select_x_max and selected_x = false {
		select_x += 1;
		selected_x = true;
	}
	
	if !key_left and !key_right {
		selected_x = false;
	}
	
	//selected
	if key_select and select_x = 1 { //restart
		room_persistent = false;
		room_restart();
		instance_deactivate_all(false);
	}
	
	if key_select and select_x = 2 { //main menu
		game_restart();
	}
}

//darken screen
if (alpha < 0.75) {
	alpha += 0.01;	
}