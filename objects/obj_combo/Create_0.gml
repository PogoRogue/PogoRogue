combo_decrease_speed = global.combo_max/(600+global.combo_time_added); //# of frames for each combo to last

if (instance_exists(obj_player)) {
	depth = obj_player.depth - 1;
}

low_combo_meter = false;
combometer_scale = 1;
increase_combometer_scale = false;
prev_combo = 0;

//show coins
coin_alpha = 0;
current_coins = 0;