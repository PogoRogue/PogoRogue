if(!other.is_dead) and other != obj_boss_sequence_body {
	var enemy_object = other;
	if !scr_In_Array(enemies_array,enemy_object) {
		array_resize(enemies_array,array_length(enemies_array)+1);
		enemies_array[array_length(enemies_array)-1] = enemy_object;
		enemy_object.hp -= (damage + global.damage_buff - (global.damage_buff));
		enemy_object.red_frames = 10;
		scr_Reload_On_Kill();
		audio_play_sound(snd_wreckingball_hit,0,false);
	}
}