/// @description Play door close sound

if(instance_exists(body)) {
	audio_play_sound(snd_door, 0, false);
}
