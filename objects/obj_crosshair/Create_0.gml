image_speed = 0;

enemy_count = 0;
enemy_array = [];
enemy_to_target = noone;
fade_out = false;
speed_up = 0;
speed_multiply = 1;
with obj_enemy_parent {
	if bbox_right > obj_camera.x - obj_camera.view_w_half and bbox_left < obj_camera.x + obj_camera.view_w_half
	and bbox_bottom > obj_camera.y - obj_camera.view_h_half and bbox_top < obj_camera.y + obj_camera.view_h_half {
		other.enemy_count += 1;
		array_resize(other.enemy_array,array_length(other.enemy_array)+1);
		other.enemy_array[array_length(other.enemy_array)-1] = self;
	}
}
if enemy_count = 0 {
	instance_destroy();	
}else {
	randomize();
	enemy_to_target = enemy_array[irandom_range(0,array_length(enemy_array)-1)];
	x = enemy_to_target.x + irandom_range(-256,256);
	y = enemy_to_target.y + irandom_range(-256,256);
	random_set_seed(global.seed);
}

audio_play_sound(snd_targetedassassination_start,0,false);