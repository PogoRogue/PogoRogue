usable = true;
stat_1_y = 112;
stat_height = 16;

scr_All_Actives_Array();
scr_All_Passives_Array();
scr_All_Weapons_Array();

passives_unlocked = 0;
actives_unlocked = 0;
synergies_unlocked = 0;
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

instance_create_depth(-100,-100,depth,obj_player);
for(i = 0; i < array_length(global.active_unlocked_array); i++) { //actives
	if global.active_unlocked_array[i] = true {
		with obj_player {
			if all_pickups_array[other.i].is_synergy = true {
				other.synergies_unlocked++;
			}
		}
	}
}
instance_destroy(obj_player_mask);
instance_destroy(obj_player);

for(i = 0; i < array_length(global.weapon_unlocked_array); i++) { //weapons
	if global.weapon_unlocked_array[i] = true {
		weapons_unlocked++;
	}
}

total_items_unlocked = passives_unlocked + actives_unlocked + weapons_unlocked;

stat_runs_1 = ["Runs Attempted: ", string(global.total_runs)];
stat_runs_2 = ["Runs To Area 2: ", string(global.area_2_reached)];
stat_runs_3 = ["Runs To Area 3: ", string(global.area_3_reached)];
stat_runs_4 = ["Runs Completed: ", string(global.num_of_wins)];
stat_splits_1 = ["Area 1: ", scr_Convert_Frames_To_Time(global.fastest_time_area1)];
stat_splits_2 = ["Constructus: ", scr_Convert_Frames_To_Time(global.fastest_time_boss1)];
stat_splits_3 = ["Boss 2: ", scr_Convert_Frames_To_Time(global.fastest_time_boss2)];
stat_splits_4 = ["Area 2: ", scr_Convert_Frames_To_Time(global.fastest_time_area2)];
stat_splits_5 = ["Slimon Says: ", scr_Convert_Frames_To_Time(global.fastest_time_boss3)];
stat_splits_6 = ["Boss 4: ", scr_Convert_Frames_To_Time(global.fastest_time_boss4)];
stat_splits_7 = ["Area 3: ", scr_Convert_Frames_To_Time(global.fastest_time_area3)];
stat_splits_8 = ["Proto-Rogo: ", scr_Convert_Frames_To_Time(global.fastest_time_boss5)];
stat_splits_9 = ["Full Game Custom Seed: ", scr_Convert_Frames_To_Time(global.fastest_time_custom)];
stat_splits_10 = ["Full Game Random Seed: ", scr_Convert_Frames_To_Time(global.fastest_time_random)];
stat_enemies_1 = ["Most Enemies Killed: ", string(global.best_enemies)];
stat_enemies_2 = ["Total Enemies Killed: ", string(global.enemies_killed)];
stat_enemies_3 = ["Highest Combo: ", string(global.best_combo)];
stat_coins_1 = ["Most Coins Collected: ", string(global.best_coins)];
stat_coins_2 = ["Total Coins Collected: ", string(global.total_coins)];
stat_items_1 = ["Passives Found: ", string(passives_unlocked) + "/" + string(array_length(global.all_buffs))];
stat_items_2 = ["Actives Found: ", string(actives_unlocked) + "/" + string(array_length(global.all_pickups_list))];
stat_items_3 = ["Synergies Found: ", string(synergies_unlocked) + "/" + string(10)];
stat_items_4 = ["Weapons Found: ", string(weapons_unlocked) + "/" + string(array_length(global.all_weapons_list))];
stat_items_5 = ["Total Items Found: ", string(total_items_unlocked) + "/" + string(array_length(global.all_buffs) + array_length(global.all_weapons_list) + array_length(global.all_pickups_list))];

//stats_array = [stat_1,stat_2,stat_3,stat_4,stat_5,stat_6,stat_7,stat_8,stat_9];

stats_array_runs = ["Runs",stat_runs_1,stat_runs_2,stat_runs_3,stat_runs_4];
stats_array_splits = ["Best Splits",stat_splits_1,stat_splits_2,stat_splits_3,stat_splits_4,stat_splits_5,stat_splits_6,stat_splits_7,stat_splits_8,stat_splits_9,stat_splits_10];
stats_array_enemies = ["Enemies",stat_enemies_1,stat_enemies_2,stat_enemies_3];
stats_array_coins = ["Coins",stat_coins_1,stat_coins_2];
stats_array_items = ["Items",stat_items_1,stat_items_2,stat_items_3,stat_items_4,stat_items_5];