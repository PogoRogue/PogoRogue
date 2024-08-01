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
chars_per_line = 15;
play_sound = false;
image_speed = 0;
image_index = 0;
current_text = text1;
current_line = 1;

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_itemdescription2);

text_pixel_height = 10;

switch (string_height(scr_Linebreak(current_text,chars_per_line,chars_per_line))) {
	case 10: num_of_lines = 1; text_pixel_height = 10; break;
	case 20: num_of_lines = 2; text_pixel_height = 20; break;
	case 30: num_of_lines = 3; text_pixel_height = 30; break;
	case 40: num_of_lines = 4; text_pixel_height = 40; break;
	default: num_of_lines = 4; text_pixel_height = 40; break;
}

new_text_pixel_height = text_pixel_height;
resize_frames = 4;
resize_frames_max = 4;
new_y_offset_spd = 0;

y -= (num_of_lines * 4);
init_y = y;

if instance_exists(parent_index) {
	parent_yoffset = y - parent_index.y;
}
