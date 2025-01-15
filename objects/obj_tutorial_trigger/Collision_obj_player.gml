/// @description Draw cutin

if(!triggered) {
	triggered = true;
	if new_y_coordinate = 3664 {
		obj_drone_tutorial.delete_speech_bubble = true;
		instance_destroy();
	}
	obj_drone_tutorial.end_x = new_x_coordinate; obj_drone_tutorial.end_y = new_y_coordinate; obj_drone_tutorial.still = false; obj_drone_tutorial.retract_current_bubble = true; obj_drone_tutorial.y_up = true; obj_drone_tutorial.y_add = 0;
	
	if combo_trigger = true and obj_drone_tutorial.current_speechbubble = 8{
		with obj_drone_tutorial {
				with speechbubble_array[current_speechbubble] {
					if retract = false {
						retract = true;
						audio_play_sound(snd_speechbubble_close,0,false);
					}
					retract = true;
					destroy_on_retract = true;
					activated = false;
					type_text = false;
					animation_speed = 0.5;
					scrolling_text = "";
					current_character = 0;
				}
				retract_current_bubble = false;
		}
		obj_drone_tutorial.current_speechbubble = 10;
	}
	
	
	if move_screen = true {
		obj_tutorial_screen.end_x = new_screen_coordinate_x;
		obj_tutorial_screen.end_y = new_screen_coordinate_y; 
		obj_tutorial_screen.still = false; 
		obj_tutorial_screen.y_up = true; 
		obj_tutorial_screen.y_add = 0;
	}
}