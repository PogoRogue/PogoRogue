// Get HP values from player

if instance_number(obj_player_health) > 1 {
	instance_destroy();	
}

parent_index = instance_nearest(x,y,obj_player);

hp = parent_index.hp;
max_hp = parent_index.max_hp;
max_max_hp = parent_index.max_max_hp;
armor_buff = parent_index.armor_buff;
max_armor_buff = parent_index.max_armor_buff;
armor_buff = parent_index.armor_buff;
max_armor_buff = parent_index.max_armor_buff;
energy_buff = parent_index.energy_buff;
max_energy_buff = parent_index.max_energy_buff;
heart_gain_num = 0;
heart_lost_num = -8;
heart_shield_gain_num = 0;
heart_shield_lost_num = 0;
heart_energy_gain_num = 0;
heart_energy_lost_num = 0;
energy_to_gain = 4;