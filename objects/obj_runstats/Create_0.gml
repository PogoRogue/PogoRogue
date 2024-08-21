if (instance_number(obj_runstats) > 1) {
	instance_destroy();	
}else {
	
	global.current_enemies_killed = 0;
	global.current_best_combo = 0;
	global.current_total_coins = 0;
	global.current_area_reached = 1;
	global.current_time_elapsed = 0;
	global.current_time_elapsed_area1 = 0;
	global.current_time_elapsed_boss1 = 0;
	global.current_time_elapsed_boss2 = 0;
	global.current_time_elapsed_area2 = 0;
	global.current_time_elapsed_boss3 = 0;
	global.current_time_elapsed_boss4 = 0;
	global.current_time_elapsed_area3 = 0;
	global.current_time_elapsed_boss5 = 0;
	
	
	global.all_weapons_used = []; //only need sprites
	global.all_passives_used = []; //only need sprites
	global.all_actives_used = []; //only need sprites
	
	global.new_best_split = 0;
}

shown_stats = false;
stop_time = false;
time_stopped = false;
new_best = 0;