next_button = global.key_interact;

//spawn
if distance_to_object(obj_player) < spawn_distance and activated = false and alarm_retracted = false and destroy_on_retract = false and awake = true {
	activated = true;
	animation_speed = 0.5;
	retract = false;
	alarm[1] = alarm1_time; //retract
	current_text = text_array[0];
	current_line = 1;
	y_offset = 0;
	y = init_y;
	resize_frames = 4;
	draw_set_font(fnt_itemdescription2);
	switch (string_height(scr_Linebreak(current_text,chars_per_line,99))) {
		/*case 10: num_of_lines = 1; new_text_pixel_height = 10; break;
		case 20: num_of_lines = 2; new_text_pixel_height = 20; break;
		case 30: num_of_lines = 3; new_text_pixel_height = 30; break;
		case 40: num_of_lines = 4; new_text_pixel_height = 40; break;
		case 50: num_of_lines = 5; new_text_pixel_height = 50; break;
		case 60: num_of_lines = 6; new_text_pixel_height = 60; break;
		case 70: num_of_lines = 7; new_text_pixel_height = 70; break;
		case 80: num_of_lines = 8; new_text_pixel_height = 80; break;*/
		default: num_of_lines = ceil((string_height(scr_Linebreak(current_text,chars_per_line,99)))/10)+3; new_text_pixel_height = num_of_lines * 10; break;
	}
	text_pixel_height = new_text_pixel_height;
	
	new_y_offset_spd = 0;
}
draw_set_font(fnt_itemdescription2);
//show_debug_message(string_height(scr_Linebreak(current_text,chars_per_line,99)));
show_debug_message(num_of_lines);
show_debug_message(new_text_pixel_height);

//retract
if (distance_to_object(obj_player) > retract_distance and retract_distance != 0) and activated = true and retract = false {
	retract = true;
	destroy_on_retract = false;
	activated = false;
	type_text = false;
	animation_speed = 0.5;
	scrolling_text = "";
	current_character = 0;
}

if (next_button and retract_distance = 0) and activated = true and retract = false and current_line >= lines_of_text {
	if repeat_text = false {
		retract = true;
		destroy_on_retract = true;
		activated = false;
		type_text = false;
		animation_speed = 0.5;
		scrolling_text = "";
		current_character = 0;
	}else if scrolling_text = current_text { //repeat
		alarm[0] = 2;
		scrolling_text = "";
		current_line = repeat_to_line;
		current_character = 0;
		type_text = false;
		current_text = text_array[repeat_to_line-1];
		resize_frames = 0;
		new_y_offset_spd = 0;
		animation_speed = 0.5;
		repeated = true;
	}
}


//scroll text
if next_button and retract = false {
	if current_line < lines_of_text and scrolling_text = current_text {
		alarm[0] = 2;
		resize_frames = 0;
		animation_speed = 0.5;
		scrolling_text = "";
		current_character = 0;
		current_line += 1;
		/*if current_line = 2 {
			current_text = text2;
		}else if current_line = 3 {
			current_text = text3;
		}else if current_line = 4 {
			current_text = text4;
		}*/
		current_text = text_array[current_line-1];
		new_y_offset_spd = 0;
	}
}

//activated animation
if activated = true {
	if bubble_index < sprite_get_number(sprite_index)-1 {
		bubble_index += animation_speed;
	}
	
	if bubble_index >= 7 + (3*size2) and bubble_index < 9 + (3*size2) {
		y_offset += num_of_lines;
	}
	
	if bubble_index >= 2 + (8*size2) {
		if type_text = false {
			type_text = true;
			alarm[0] = 2;
		}
	}
}


draw_set_font(fnt_itemdescription2);


if scrolling_text != current_text and (current_line > 1 or repeated = true) {
	switch (string_height(scr_Linebreak(current_text,chars_per_line,99))) {
		/**=case 10: num_of_lines = 1; new_text_pixel_height = 10; break;
		case 20: num_of_lines = 2; new_text_pixel_height = 20; break;
		case 30: num_of_lines = 3; new_text_pixel_height = 30; break;
		case 40: num_of_lines = 4; new_text_pixel_height = 40; break;
		case 50: num_of_lines = 5; new_text_pixel_height = 50; break;
		case 60: num_of_lines = 6; new_text_pixel_height = 60; break;
		case 70: num_of_lines = 7; new_text_pixel_height = 70; break;
		case 80: num_of_lines = 8; new_text_pixel_height = 80; break;*/
		default: num_of_lines = ceil((string_height(scr_Linebreak(current_text,chars_per_line,99)))/10)+3; new_text_pixel_height = num_of_lines * 10; break;
	}
	
	if new_text_pixel_height != text_pixel_height {
		new_y_offset_spd = (new_text_pixel_height-text_pixel_height)/64;
		text_pixel_height = new_text_pixel_height;
	}
}

if resize_frames < resize_frames_max {
	resize_frames += 1;
	y_offset += new_y_offset_spd;
	y -= new_y_offset_spd;
}

//retract animation
if retract = true {
	if bubble_index > 0 {
		bubble_index -= animation_speed;
	}else if destroy_on_retract {
		instance_destroy();
	}
	
	if bubble_index >= 7 + (3*size2) and bubble_index < 9 + (3*size2) and y_offset > 0 {
		y_offset -= num_of_lines;
	}
	
	type_text = false;
}

if floor(bubble_index) = sprite_get_number(sprite_index)-1 and retract = false {
	animation_speed = 0;
}