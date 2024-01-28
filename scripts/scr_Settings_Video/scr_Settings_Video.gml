// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Settings_Video(){
	option_fullscreen = {
		_text: "Fullscreen: ",
		_type: "checkbox",
		default_mode: window_get_fullscreen(),
		current_mode: window_get_fullscreen(),
		do_on_true: function() {
			window_set_fullscreen(true);
		},
		do_on_false: function() {
			window_set_fullscreen(false);	
			with obj_settings {
				window_set_size(menu_video.options_array[1].list_of_options[menu_video.options_array[1].current_selection][0],menu_video.options_array[1].list_of_options[menu_video.options_array[1].current_selection][1]);
				alarm[1] = 10;
			}
		}
	};
	
	option_resolution = {
		_text: "Window Resolution: ",
		_type: "list_slider",
		num_of_values: 5,
		list_of_options: [[768,432],[1280,720],[1536,900],[1760,990],[1920,1080]],
		default_mode: 4,
		current_selection: global.resolution_num,
		on_select: function() {
			window_set_size(list_of_options[current_selection][0],list_of_options[current_selection][1]);
		},
		on_existing: function() {
			obj_settings.list_slider_str = string(list_of_options[current_selection][0]) + "x" + string(list_of_options[current_selection][1]);	
		}
	};

	menu_video = {
		num_of_options: 2,										//number of possible options
		options_array: [option_fullscreen,option_resolution],   //options in array
	};
}