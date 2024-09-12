// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Settings_Video(){
	option_fullscreen = {
		_text: "Fullscreen: ",
		_type: "checkbox",
		default_mode: global.fullscreen,
		current_mode: global.fullscreen,
		do_on_true: function() {
			global.fullscreen = true;
			window_set_fullscreen(true);
			scr_Save_Real("fullscreen",global.fullscreen);
			audio_play_sound(snd_selectOption,0,false);
		},
		do_on_false: function() {
			global.fullscreen = false;
			window_set_fullscreen(false);
			scr_Save_Real("fullscreen",global.fullscreen);
			with obj_settings {
				window_set_size(menu_video.options_array[1].list_of_options[menu_video.options_array[1].current_selection][0],menu_video.options_array[1].list_of_options[menu_video.options_array[1].current_selection][1]);
				alarm[1] = 10;
			}
			audio_play_sound(snd_selectOption,0,false);
		}
	};
	
	option_resolution = {
		_text: "Window Resolution: ",
		_type: "list_slider",
		num_of_values: 5,
		list_of_options: [[768,432],[1280,720],[1536,864],[1760,990],[1920,1080]],
		default_mode: global.resolution_num,
		current_selection: global.resolution_num,
		on_select: function() {
			window_set_size(list_of_options[current_selection][0],list_of_options[current_selection][1]);
		},
		on_existing: function() {
			obj_settings.list_slider_str = string(list_of_options[current_selection][0]) + "x" + string(list_of_options[current_selection][1]);	
		}
	};
	
	option_flash = {
		_text: "Flash: ",
		_type: "checkbox",
		default_mode: global.flash,
		current_mode: global.flash,
		do_on_true: function() {
			global.flash = true;
			scr_Save_Real("flash",global.flash);
			audio_play_sound(snd_selectOption,0,false);
		},
		do_on_false: function() {
			global.flash = false;
			scr_Save_Real("flash",global.flash);
			audio_play_sound(snd_selectOption,0,false);
		}
	};

	menu_video = {
		num_of_options: 3,										//number of possible options
		options_array: [option_fullscreen,option_resolution, option_flash],   //options in array
	};
	
}