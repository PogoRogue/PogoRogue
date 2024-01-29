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
		on_select: function() {
			with obj_settings {
				global.sound_volume = menu_audio.options_array[0].current_value;
				scr_Save_Real("sound_volume",global.sound_volume);
				audio_group_set_gain(audiogroup_default,global.sound_volume/100,100);
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
		on_select: function() {
			with obj_settings {
				global.music_volume = menu_audio.options_array[1].current_value;
				scr_Save_Real("music_volume",global.music_volume);
				audio_group_set_gain(audiogroup_music,global.music_volume/100,100);
				if menu_audio.options_array[1].current_value > menu_audio.options_array[1].lowest_value {
					audio_play_sound(snd_menuNavigation,0,false);
				}
			}
		},
	};

	menu_audio = {
		num_of_options: 2,										//number of possible options
		options_array: [option_soundvolume,option_musicvolume], //options in array
	};
}