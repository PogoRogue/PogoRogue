/// @description Destroy
instance_destroy();
with obj_pausemenu {
	usable = true;	
	audio_play_sound(snd_unavailable,0,false);
}
with obj_menu {
	usable = true;	
}