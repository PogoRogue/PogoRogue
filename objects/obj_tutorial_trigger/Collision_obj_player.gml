/// @description Draw cutin

if(!triggered) {
	triggered = true;
	if new_y_coordinate = 3664 {
		obj_drone_tutorial.delete_speech_bubble = true;
		instance_destroy();
	}
	 obj_drone_tutorial.end_x = new_x_coordinate; obj_drone_tutorial.end_y = new_y_coordinate; obj_drone_tutorial.still = false; obj_drone_tutorial.retract_current_bubble = true; obj_drone_tutorial.y_up = true; obj_drone_tutorial.y_add = 0;
}