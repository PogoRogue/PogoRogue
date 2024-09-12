/// @description hold left/right
if key_left and !key_right and selected_x = true
or key_right and !key_left and selected_x = true {
	selected_x = false;
	alarm2_time = 5;
}