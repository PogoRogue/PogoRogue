javelin_object = noone;

charge = 0;
charge_max = 9;
frames_to_charge = 40;

if !audio_is_playing(snd_javelin_charge) {
	audio_play_sound(snd_javelin_charge,0,false);
}