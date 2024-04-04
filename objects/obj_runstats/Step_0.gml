//increase time
if instance_exists(obj_player) {
	with obj_pause {
		if pause = false and obj_player.dead = false and room != room_shop {
			global.current_time_elapsed += 1;
		}
	}
}

//area reached
global.current_area_reached = global.phase;

if global.phase = 2 {
	global.tileset = tl_ground2;	
}
if global.phase = 3 {
	global.tileset = tl_ground2;	
}

//update best stats

//check if coins is new best
if global.current_total_coins > global.best_coins { //best coins across all runs
	global.best_coins = global.current_total_coins;
	scr_Save_Real("best_coins",global.best_coins);
}

//check if enemy killed is new best
if global.current_enemies_killed > global.best_enemies { //best enemies killed across all runs
	global.best_enemies = global.current_enemies_killed;
	scr_Save_Real("best_enemies",global.best_enemies);
}

//add items

//weapons
with obj_player {
	if scr_In_Array(global.all_weapons_used,gun_1.sprite) = false and gun_1.sprite != spr_nothing {
		array_resize(global.all_weapons_used,array_length(global.all_weapons_used)+1);
		global.all_weapons_used[array_length(global.all_weapons_used)-1] = gun_1.sprite;
	}
	if scr_In_Array(global.all_weapons_used,gun_2.sprite) = false and gun_2.sprite != spr_nothing {
		array_resize(global.all_weapons_used,array_length(global.all_weapons_used)+1);
		global.all_weapons_used[array_length(global.all_weapons_used)-1] = gun_2.sprite;
	}
	if scr_In_Array(global.all_weapons_used,gun_3.sprite) = false and gun_3.sprite != spr_nothing {
		array_resize(global.all_weapons_used,array_length(global.all_weapons_used)+1);
		global.all_weapons_used[array_length(global.all_weapons_used)-1] = gun_3.sprite;
	}
}

//actives
with obj_player {
	if scr_In_Array(global.all_actives_used,pickup_1.gui_sprite) = false and pickup_1.gui_sprite != spr_pickup_empty {
		array_resize(global.all_actives_used,array_length(global.all_actives_used)+1);
		global.all_actives_used[array_length(global.all_actives_used)-1] = pickup_1.gui_sprite;
	}
	if scr_In_Array(global.all_actives_used,pickup_2.gui_sprite) = false and pickup_2.gui_sprite != spr_pickup_empty {
		array_resize(global.all_actives_used,array_length(global.all_actives_used)+1);
		global.all_actives_used[array_length(global.all_actives_used)-1] = pickup_2.gui_sprite;
	}
}