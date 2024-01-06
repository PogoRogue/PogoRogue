/// @description Get damaged
if(other.power_on && current_iframes <= 0) {
	scr_Player_Damaged(other.damage);
	audio_play_sound(snd_electricity,0,false);
}
