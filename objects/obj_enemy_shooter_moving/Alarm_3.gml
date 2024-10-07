
if(!is_dead) and scr_In_Camera_View(200) and !megabounce_freeze {
	instance_create_layer(x - (3 * sign(image_xscale)), y, "Instances", obj_enemy_projectile_lob);
	instance_create_layer(x - (3 * sign(image_xscale)), y, "Instances", obj_enemy_projectile_lob,{hspeed: -0.75});
	instance_create_layer(x - (3 * sign(image_xscale)), y, "Instances", obj_enemy_projectile_lob,{hspeed: 0.75});
}

if scr_In_Camera_View(128) and !audio_is_playing(snd_turtle_shoot) and !megabounce_freeze {
	audio_play_sound(snd_turtle_shoot,0,false);	
}