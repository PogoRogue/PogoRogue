usable = true;
stat_1_y = 112;
stat_height = 32;

scr_All_Actives_Array();
scr_All_Passives_Array();
scr_All_Weapons_Array();

passives_unlocked = 0;
actives_unlocked = 0;
weapons_unlocked = 0;

for(i = 0; i < array_length(global.passive_unlocked_array); i++) { //passives
	if global.passive_unlocked_array[i] = true {
		passives_unlocked++;
	}
}
for(i = 0; i < array_length(global.active_unlocked_array); i++) { //actives
	if global.active_unlocked_array[i] = true {
		actives_unlocked++;
	}
}
for(i = 0; i < array_length(global.weapon_unlocked_array); i++) { //weapons
	if global.weapon_unlocked_array[i] = true {
		weapons_unlocked++;
	}
}

total_items_unlocked = passives_unlocked + actives_unlocked + weapons_unlocked;

stat_1 = ["Runs Attempted: ", string(global.total_runs)];
stat_2 = ["Area 2 Reached: ", string(global.area_2_reached) + " Times"];
stat_3 = ["Area 3 Reached: ", string(global.area_3_reached) + " Times"];
stat_4 = ["Runs Beaten: ", string(global.num_of_wins)];
stat_5 = ["Fastest Completion Time: ", scr_Convert_Frames_To_Time(global.fastest_time)];
stat_6 = ["Highest Combo: ", string(global.best_combo)];
stat_7 = ["Most Enemies Killed: ", string(global.best_enemies)];
stat_8 = ["Most Coins Collected: ", string(global.best_coins)];
stat_9 = ["Items Unlocked: ", string(total_items_unlocked) + "/" + string(array_length(global.all_buffs) + array_length(global.all_weapons_list) + array_length(global.all_pickups_list))];
stats_array = [stat_1,stat_2,stat_3,stat_4,stat_5,stat_6,stat_7,stat_8,stat_9];