key_back = global.key_back;

if key_back and !instance_exists(obj_fade_in) {
	scr_Room_Transition(room_menu);
	audio_play_sound(snd_unavailable,0,false);
}