/// @description Destroy
instance_destroy();
if instance_exists(obj_pausemenu) {
	with obj_pausemenu {
		usable = true;	
		audio_play_sound(snd_unavailable,0,false);
	}
}else {
	with obj_pause {
		item_swap = false;
		paused_outside = true;
	}
}