/// @description Despawn shield

//instance_destroy(shield);

event_inherited();

if audio_is_playing(sound) {
	audio_stop_sound(sound);
}