//armored heart
audio_play_sound(snd_zap,0,false);
other.heart_energy_gain_num = obj_player.energy_buff;
instance_create_depth(28 + (max_hp/8 * 24) + (armor_buff*24) + ((energy_to_gain-1) * 24), 32,depth-1,obj_heart_energy_gain);