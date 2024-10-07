/// @description Drop mine

if(!is_dead) {
	instance_create_depth(x-24*(image_xscale), y , depth + 1, obj_enemy_car_mine);
	alarm_set(1, mine_delay);
	if scr_In_Camera_View(128) {
		audio_play_sound(snd_bombplaced,0,false);
	}
}
