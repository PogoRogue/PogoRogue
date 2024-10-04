sprite_index = spr_menu_tutorial;
options_decrease = 0;

select = 1;
selected = false;
num_of_options = 6-options_decrease;
usable = true;
room_persistent = false;
move_spd = 0;
alarm3_time = 30;

alarm[0] = 10; //play music

//Store the randomized seed, and print it to console

//If you want to manually set the seed to a number, don't call randomize, and instead set seed = ######
randomize()
global.seed = random_get_seed();


random_set_seed(global.seed);
show_debug_message("Random seed: " + string(global.seed));
global.seed_switched = false;
global.current_music = snd_music_menu;

frame = 0;


global.player_starting_x =  1096;
global.player_starting_y = 1136;

if audio_is_playing(snd_music_level1) {
	audio_stop_sound(snd_music_level1);
}
audio_group_set_gain(audiogroup_music, ((exp(0.24*((10 / 100) * global.music_volume))-1)/10), 1);