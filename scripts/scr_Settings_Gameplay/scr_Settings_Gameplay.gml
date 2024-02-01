// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Settings_Gameplay(){
	option_tiltspeed = {
		_text: "Tilt Speed: ",
		_type: "slider",
		lowest_value: 2,
		highest_value: 4,
		increment: 0.1,
		default_value: global.tilt_speed,
		current_value: global.tilt_speed,
		add_to_string: "",
		on_select: function() {
			with obj_settings {
				global.tilt_speed = menu_gameplay.options_array[0].current_value;
				scr_Save_Real("tilt_speed",global.tilt_speed)
				audio_play_sound(snd_menuNavigation,0,false);
				instance_activate_object(obj_player);
				with obj_player {
					rotation_speed = global.tilt_speed;
					original_rotation_speed = global.tilt_speed;
					current_rotation_speed = 0;
					rotation_delay = rotation_speed / 10; //0.5
				}
				instance_deactivate_object(obj_player);
			}
		},
	};
	
	option_screenshake = {
		_text: "Screen Shake: ",
		_type: "slider",
		lowest_value: 0,
		highest_value: 100,
		increment: 10,
		default_value: global.screenshake,
		current_value: global.screenshake,
		add_to_string: "%",
		on_select: function() {
			with obj_settings {
				global.screenshake = menu_gameplay.options_array[1].current_value;
				scr_Save_Real("screenshake",global.screenshake);
				audio_play_sound(snd_menuNavigation,0,false);
			}
		},
	};
	
	option_controllershake = {
		_text: "Controller Vibration: ",
		_type: "slider",
		lowest_value: 0,
		highest_value: 100,
		increment: 10,
		default_value: global.controller_vibration,
		current_value: global.controller_vibration,
		add_to_string: "%",
		on_select: function() {
			with obj_settings {
				global.controller_vibration = menu_gameplay.options_array[2].current_value;
				scr_Save_Real("controller_vibration",global.controller_vibration);
				audio_play_sound(snd_menuNavigation,0,false);
			}
		},
	};
	
	option_showtimer = {
		_text: "Show Timer: ",
		_type: "checkbox",
		default_mode: global.show_timer,
		current_mode: global.show_timer,
		do_on_true: function() {
			global.show_timer = true;
			scr_Save_Real("show_timer",global.show_timer);
			audio_play_sound(snd_selectOption,0,false);
		},
		do_on_false: function() {
			global.show_timer = false;
			scr_Save_Real("show_timer",global.show_timer);
			audio_play_sound(snd_selectOption,0,false);
		}
	};
	
	option_showcoins = {
		_text: "Show Coin UI: ",
		_type: "checkbox",
		default_mode: global.show_coins,
		current_mode: global.show_coins,
		do_on_true: function() {
			global.show_coins = true;
			scr_Save_Real("show_coins",global.show_coins);
			audio_play_sound(snd_selectOption,0,false);
		},
		do_on_false: function() {
			global.show_coins = false;
			scr_Save_Real("show_coins",global.show_coins);
			audio_play_sound(snd_selectOption,0,false);
		}
	};
	
	option_showpassives = {
		_text: "Show Passive Item List: ",
		_type: "checkbox",
		default_mode: global.show_passives,
		current_mode: global.show_passives,
		do_on_true: function() {
			global.show_passives = true;
			scr_Save_Real("show_passives",global.show_passives);
			audio_play_sound(snd_selectOption,0,false);
		},
		do_on_false: function() {
			global.show_passives = false;
			scr_Save_Real("show_passives",global.show_passives);
			audio_play_sound(snd_selectOption,0,false);
		}
	};
	
	option_deletesavedata = {
		_text: "Delete All Save Data",
		_type: "doonpress",
		do_on_press: function() {
			with obj_settings {
				audio_play_sound(snd_selectOption,0,false);
				usable = false;
				instance_create_depth(x,y,depth-1,obj_popup_savedata);
			}
		}
	};
	
	option_resetdefaults = {
		_text: "Reset All Settings To Default",
		_type: "doonpress",
		do_on_press: function() {
			with obj_settings {
				audio_play_sound(snd_selectOption,0,false);
				usable = false;
				instance_create_depth(x,y,depth-1,obj_popup_resetdefaults);
			}
		}
	};

	menu_gameplay = {
		num_of_options: 8,									
		options_array: [option_tiltspeed,option_screenshake,option_controllershake,
						option_showtimer,option_showcoins,option_showpassives,
						option_deletesavedata, option_resetdefaults],
	};
}