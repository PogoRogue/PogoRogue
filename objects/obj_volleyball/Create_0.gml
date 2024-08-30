randomize();
angle_speed = 5;
grav = 0.21;
hspeed = obj_player.hspeed/2;
vspeed = random_range(-4,-2);
bounce_decay = 0.8;
rot_angle = 0;
random_set_seed(global.seed);
spawning = true;
image_index = 1;
alpha = 0;
alpha_up = true;
scale = 1;
damage = 16;
enemy_object = noone;
enemies_array = [];
despawn = false;

if place_meeting(x,y,obj_ground) {
	cant_spawn = true;	
	image_index = 2;
	if audio_is_playing(snd_blink_respawn) {
		audio_stop_sound(snd_blink_respawn);
	}
	audio_play_sound(snd_unavailable,0,false);
	mask_index = spr_nothing;
}else {
	cant_spawn = false;	
}