type_text = false;
activated = false;
retract = false;
alarm_retracted = false;
bubble_index = 0;
animation_speed = 0;
y_offset = 0;
num_of_lines = 4;
scrolling_text = "";
current_character = 0;

play_sound = false;
image_speed = 0;
image_index = 0;
current_line = 1;
current_text = text_array[current_line-1];

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_itemdescription2);

text_pixel_height = 10;
new_text_pixel_height = text_pixel_height;

draw_set_font(fnt_itemdescription2);
switch (string_height(scr_Linebreak(current_text,chars_per_line,chars_per_line))) {
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

resize_frames = 4;
resize_frames_max = 15;
new_y_offset_spd = 0;

y -= (num_of_lines * 4);
init_y = y;

if instance_exists(parent_index) {
	parent_yoffset = y - parent_index.y;
}

if size2 = false {
	bottom_sprite = spr_speechbubble_bottom;
	middle_sprite = spr_speechbubble_middle;
	top_sprite = spr_speechbubble_top;
}else {
	bottom_sprite = spr_speechbubble2_bottom;
	middle_sprite = spr_speechbubble2_middle;
	top_sprite = spr_speechbubble2_top;
}

if size2 = true {
	sprite_index = spr_speechbubble2;
}

destroy_on_retract = false;
repeated = false;

if room = room_starting_area or room = room_proc_gen_test {
	depth = -15;
}