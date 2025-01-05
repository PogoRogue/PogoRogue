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

instance_create_depth(-100,-100,depth,obj_control);
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
instance_destroy(obj_control);

for(i = 0; i < array_length(global.weapon_unlocked_array); i++) { //weapons
	if global.weapon_unlocked_array[i] = true {
		weapons_unlocked++;
	}
}

total_items_unlocked = passives_unlocked + actives_unlocked + weapons_unlocked;

font_add_enable_aa(false);
uranus_bold = font_add("Uranus.ttf", 12, true, false, 32, 128);
uranus = font_add("Uranus.ttf", 11, false, false, 32, 128);

stat_runs_1 = ["已尝试次数: ", string(global.total_runs)];
stat_runs_2 = ["区域2达成次数: ", string(global.area_2_reached)];
stat_runs_3 = ["区域3达成次数: ", string(global.area_3_reached)];
stat_runs_4 = ["通关次数: ", string(global.num_of_wins)];
stat_splits_1 = ["区域1: ", scr_Convert_Frames_To_Time(global.fastest_time_area1)];
stat_splits_2 = ["积木王: ", scr_Convert_Frames_To_Time(global.fastest_time_boss1)];
stat_splits_3 = ["鼹鼠小队: ", scr_Convert_Frames_To_Time(global.fastest_time_boss2)];
stat_splits_4 = ["区域2: ", scr_Convert_Frames_To_Time(global.fastest_time_area2)];
stat_splits_5 = ["史莱姆先知: ", scr_Convert_Frames_To_Time(global.fastest_time_boss3)];
stat_splits_6 = ["爆裂球球: ", scr_Convert_Frames_To_Time(global.fastest_time_boss4)];
stat_splits_7 = ["区域3: ", scr_Convert_Frames_To_Time(global.fastest_time_area3)];
stat_splits_8 = ["罗戈杀手: ", scr_Convert_Frames_To_Time(global.fastest_time_boss5)];
stat_splits_9 = ["全局自定义种子: ", scr_Convert_Frames_To_Time(global.fastest_time_custom)];
stat_splits_10 = ["全局随机种子: ", scr_Convert_Frames_To_Time(global.fastest_time_random)];
stat_enemies_1 = ["最多击杀: ", string(global.best_enemies)];
stat_enemies_2 = ["击杀总数: ", string(global.enemies_killed)];
stat_enemies_3 = ["最高连击: ", string(global.best_combo)];
stat_coins_1 = ["最多获得: ", string(global.best_coins)];
stat_coins_2 = ["获得总数: ", string(global.total_coins)];
stat_items_1 = ["发现道具: ", string(passives_unlocked) + "/" + string(array_length(global.all_buffs))];
stat_items_2 = ["发现技能: ", string(actives_unlocked) + "/" + string(array_length(global.all_pickups_list))];
stat_items_3 = ["发现融合技能: ", string(synergies_unlocked) + "/" + string(10)];
stat_items_4 = ["发现武器: ", string(weapons_unlocked) + "/" + string(array_length(global.all_weapons_list))];
stat_items_5 = ["发现物品总和: ", string(total_items_unlocked) + "/" + string(array_length(global.all_buffs) + array_length(global.all_weapons_list) + array_length(global.all_pickups_list))];

//stats_array = [stat_1,stat_2,stat_3,stat_4,stat_5,stat_6,stat_7,stat_8,stat_9];

stats_array_runs = ["游戏局数",stat_runs_1,stat_runs_2,stat_runs_3,stat_runs_4];
stats_array_splits = ["最佳记录",stat_splits_1,stat_splits_2,stat_splits_3,stat_splits_4,stat_splits_5,stat_splits_6,stat_splits_7,stat_splits_8,stat_splits_9,stat_splits_10];
stats_array_enemies = ["敌人",stat_enemies_1,stat_enemies_2,stat_enemies_3];
stats_array_coins = ["金币",stat_coins_1,stat_coins_2];
stats_array_items = ["物品",stat_items_1,stat_items_2,stat_items_3,stat_items_4,stat_items_5];