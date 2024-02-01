/// @description Switch sliders
up_button = global.key_up_menu;
down_button = global.key_down_menu;

if (global.use_mouse_for_slider = false) {

	if (up_button) {
		if (global.slider_index > 0) {
			global.slider_index -= 1;
		}
	}

	if (down_button) {
		if (global.slider_index < number_of_sliders-1) {
			global.slider_index += 1;
		}
	}
	
}else {
	global.slider_index = 1000;
}