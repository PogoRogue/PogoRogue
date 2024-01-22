/// @description show stats
if shown_stats = false {
	show_debug_message("Enemies Killed: " + string(global.current_enemies_killed));
	show_debug_message("Best Combo: " + string(global.current_best_combo));
	show_debug_message("Coins Collected: " + string(global.current_total_coins));
	show_debug_message("Area Reached: " + string(global.current_area_reached));
	show_debug_message("Time Elapsed: " + scr_Convert_Frames_To_Time(global.current_time_elapsed));
	shown_stats = true;
}