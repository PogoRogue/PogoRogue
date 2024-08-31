next_button = global.key_interact;

//spawn
if distance_to_object(obj_player) < spawn_distance and activated = false and alarm_retracted = false {
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
	switch (string_height(scr_Linebreak(current_text,chars_per_line,chars_per_line))) {
		case 10: num_of_lines = 1; new_text_pixel_height = 10; break;
		case 20: num_of_lines = 2; new_text_pixel_height = 20; break;
		case 30: num_of_lines = 3; new_text_pixel_height = 30; break;
		case 40: num_of_lines = 4; new_text_pixel_height = 40; break;
		default: num_of_lines = 4; new_text_pixel_height = 40; break;
	}
	text_pixel_height = new_text_pixel_height;
	
	new_y_offset_spd = 0;
}

//retract
if distance_to_object(obj_player) > retract_distance and activated = true and retract = false {
	retract = true;
	activated = false;
	type_text = false;
	animation_speed = 0.5;
	scrolling_text = "";
	current_character = 0;
}

//scroll text
if next_button {
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
	}
}

//activated animation
if activated = true {
	if bubble_index < sprite_get_number(sprite_index)-1 {
		bubble_index += animation_speed;
	}
	
	if bubble_index >= 7 and bubble_index < 9 {
		y_offset += num_of_lines;
	}
	
	if bubble_index >= 2 {
		if type_text = false {
			type_text = true;
			alarm[0] = 2;
		}
	}
}


draw_set_font(fnt_itemdescription2);

if scrolling_text != current_text and current_line > 1 {
	switch (string_height(scr_Linebreak(current_text,chars_per_line,chars_per_line))) {
		case 10: num_of_lines = 1; new_text_pixel_height = 10; break;
		case 20: num_of_lines = 2; new_text_pixel_height = 20; break;
		case 30: num_of_lines = 3; new_text_pixel_height = 30; break;
		case 40: num_of_lines = 4; new_text_pixel_height = 40; break;
		default: num_of_lines = 4; new_text_pixel_height = 40; break;
	}
	
	if new_text_pixel_height != text_pixel_height {
		new_y_offset_spd = (new_text_pixel_height-text_pixel_height)/10;
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
	}
	
	if bubble_index >= 7 and bubble_index < 9 and y_offset > 0 {
		y_offset -= num_of_lines;
	}
	
	type_text = false;
}

if floor(bubble_index) = sprite_get_number(sprite_index)-1 and retract = false {
	animation_speed = 0;
}