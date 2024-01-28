if global.combo_length > 0 {
	if global.combo > 0 {
		global.combo_length -= combo_decrease_speed;
	}else {
		global.combo_length = 0;
	}
}else {
	global.combo = 0;
}

if global.combo_length <= global.combo_max/4 {
	low_combo_meter = true;
}else {
	low_combo_meter = false;
}

combo_decrease_speed = global.combo_max/(500+global.combo_time_added); //# of frames for each combo to last

//increase combo meter size
if increase_combometer_scale = false and global.combo > prev_combo {
	prev_combo = global.combo;
	increase_combometer_scale = true;
	combometer_scale = 1.6;
}

if combometer_scale > 1 {
	combometer_scale -= 0.04;
	increase_combometer_scale = true;
}else {
	combometer_scale = 1;
	increase_combometer_scale = false;
}

if global.combo = 0 {
	prev_combo = global.combo;
}

//check if combo is new best
if global.combo > global.best_combo { //best combo across all runs
	global.best_combo = global.combo;
	scr_Save_Real("best_combo",global.best_combo);
}

if coin_alpha > 0 {
	coin_alpha -= 0.05;
}else {
	coin_alpha = 0;
	current_coins = 0;
}