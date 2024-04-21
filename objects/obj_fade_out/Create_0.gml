depth = -1001;

x_offset = 384;
spd = 8;
transitioned = false;

if !audio_is_playing(snd_uidoor_close) {
	audio_play_sound(snd_uidoor_close,0,false);
}