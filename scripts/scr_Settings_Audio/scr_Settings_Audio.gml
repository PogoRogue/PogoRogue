// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Settings_Audio(){
	option_soundvolume = {
		_text: "Sound Volume: ",
		_type: "slider",
		lowest_value: 0,
		highest_value: 100,
		increment: 10,
		default_value: global.sound_volume,
		current_value: global.sound_volume,
		add_to_string: "%",
		on_select: function() {
			with obj_settings {
				global.sound_volume = menu_audio.options_array[0].current_value;
				var volume = (exp(0.24*((10 / 100) * global.sound_volume))-1)/10;
				scr_Save_Real("sound_volume",global.sound_volume);
				audio_group_set_gain(audiogroup_default,volume,100);
				if menu_audio.options_array[0].current_value > menu_audio.options_array[0].lowest_value {
					audio_play_sound(snd_menuNavigation,0,false);
				}
			}
		},
	};
	
	option_musicvolume = {
		_text: "Music Volume: ",
		_type: "slider",
		lowest_value: 0,
		highest_value: 100,
		increment: 10,
		default_value: global.music_volume,
		current_value: global.music_volume,
		add_to_string: "%",
		on_select: function() {
			with obj_settings {
				global.music_volume = menu_audio.options_array[1].current_value;
				var volume2 = (exp(0.24*((10 / 100) * global.music_volume))-1)/10;
				scr_Save_Real("music_volume",global.music_volume);
				audio_group_set_gain(audiogroup_music,volume2,100);
				audio_play_sound(snd_menuNavigation,0,false);
			}
		},
	};

	menu_audio = {
		num_of_options: 2,										//number of possible options
		options_array: [option_soundvolume,option_musicvolume], //options in array
	};
}