//armored heart
if energy_to_gain > 0 {
	alarm[0] = 20;
	audio_play_sound(snd_zap,0,false);
	other.heart_energy_gain_num = obj_player.energy_buff;
	energy_to_gain -= 1;
	instance_create_depth(28 + (max_hp/8 * 24) + (armor_buff*24) + ((energy_to_gain-1) * 24), 32,depth-1,obj_heart_energy_gain);
}else {
	energy_to_gain = 3;
}
