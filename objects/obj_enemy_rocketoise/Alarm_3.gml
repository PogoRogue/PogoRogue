/// @description Create projectile

if is_dead = false {
	instance_create_layer(x - (3 * sign(image_xscale)), y, "Instances", obj_missles_pattern);
}

if scr_In_Camera_View(64) and !audio_is_playing(snd_turtle_shoot) {
	audio_play_sound(snd_turtle_shoot,0,false);	
}