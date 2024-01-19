if (instance_number(obj_runstats) > 1) {
	instance_destroy();	
}else {
	global.current_enemies_killed = 0;
	global.current_best_combo = 0;
	global.current_total_coins = 0;
	global.current_area_reached = 1;
	global.current_time_elapsed = 0;
	
	global.all_weapons_used = []; //only need sprites
	global.all_passives_used = []; //only need sprites
	global.all_actives_used = []; //only need sprites
}

shown_stats = false;