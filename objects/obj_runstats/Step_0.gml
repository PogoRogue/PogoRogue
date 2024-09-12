//increase time
if instance_exists(obj_player) {
	with obj_pause {
		if pause = false and obj_player.dead = false and room != room_shop and !instance_exists(obj_deathscreen) and other.stop_time = false and obj_player.state != obj_player.state_shop_portal {
			global.current_time_elapsed += 1;
			if room = room_proc_gen_test {
				if global.phase = 1 {
					global.current_time_elapsed_area1 += 1;
				}else if global.phase = 2 {
					global.current_time_elapsed_area2 += 1;
				}else if global.phase = 3 {
					global.current_time_elapsed_area3 += 1;
				}
			}else if room = room_boss_1 {
				global.current_time_elapsed_boss1 += 1;
			}else if room = room_boss_2 {
				global.current_time_elapsed_boss3 += 1;
			}else if room = room_boss_3 {
				global.current_time_elapsed_boss5 += 1;
			}
		}
	}
}

//area reached
global.current_area_reached = global.phase;

if global.phase = 2 {
	global.tileset = tl_ground2;	
}
if global.phase = 3 {
	global.tileset = tl_ground3;
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

//splits


if stop_time = true and time_stopped = false {

	//area 1
	if (global.current_time_elapsed_area1 < global.fastest_time_area1
	or global.fastest_time_area1 = 0) and global.current_time_elapsed_area1 > 100 
	and room = room_proc_gen_test {
		global.fastest_time_area1 = global.current_time_elapsed_area1;
		global.new_best_split = global.current_time_elapsed_area1;
		scr_Save_Real("fastest_time_area1",global.fastest_time_area1);
		instance_create_depth(x,y,depth,obj_newbest_split)
	}else if (global.current_time_elapsed_area2 < global.fastest_time_area2
	or global.fastest_time_area2 = 0) and global.current_time_elapsed_area2 > 100
	and room = room_proc_gen_test { //area 2
		global.fastest_time_area2 = global.current_time_elapsed_area2;
		global.new_best_split = global.current_time_elapsed_area2;
		scr_Save_Real("fastest_time_area2",global.fastest_time_area2);
		instance_create_depth(x,y,depth,obj_newbest_split)
	}else if (global.current_time_elapsed_area3 < global.fastest_time_area3
	or global.fastest_time_area3 = 0) and global.current_time_elapsed_area3 > 100 
	and room = room_proc_gen_test { //area 3
		global.fastest_time_area3 = global.current_time_elapsed_area3;
		global.new_best_split = global.current_time_elapsed_area3;
		scr_Save_Real("fastest_time_area3",global.fastest_time_area3);
		instance_create_depth(x,y,depth,obj_newbest_split)
	}else if (global.current_time_elapsed_boss1 < global.fastest_time_boss1
	or global.fastest_time_boss1 = 0) and global.current_time_elapsed_boss1 > 100 
	and room = room_boss_1 { //boss 1
		global.fastest_time_boss1 = global.current_time_elapsed_boss1;
		global.new_best_split = global.current_time_elapsed_boss1;
		scr_Save_Real("fastest_time_boss1",global.fastest_time_boss1);
		instance_create_depth(x,y,depth,obj_newbest_split)
	}else if (global.current_time_elapsed_boss2 < global.fastest_time_boss2
	or global.fastest_time_boss2 = 0) and global.current_time_elapsed_boss2 > 100 { //boss 2
		global.fastest_time_boss2 = global.current_time_elapsed_boss2;
		global.new_best_split = global.current_time_elapsed_boss2;
		scr_Save_Real("fastest_time_boss2",global.fastest_time_boss2);
		instance_create_depth(x,y,depth,obj_newbest_split)
	}else if (global.current_time_elapsed_boss3 < global.fastest_time_boss3
	or global.fastest_time_boss3 = 0) and global.current_time_elapsed_boss3 > 100
	and room = room_boss_2 { //boss 3
		global.fastest_time_boss3 = global.current_time_elapsed_boss3;
		global.new_best_split = global.current_time_elapsed_boss3;
		scr_Save_Real("fastest_time_boss3",global.fastest_time_boss3);
		instance_create_depth(x,y,depth,obj_newbest_split)
	}else if (global.current_time_elapsed_boss4 < global.fastest_time_boss4
	or global.fastest_time_boss4 = 0) and global.current_time_elapsed_boss4 > 100 { //boss 4
		global.fastest_time_boss4 = global.current_time_elapsed_boss4;
		global.new_best_split = global.current_time_elapsed_boss4;
		scr_Save_Real("fastest_time_boss4",global.fastest_time_boss4);
		instance_create_depth(x,y,depth,obj_newbest_split)
	}else if (global.current_time_elapsed_boss5 < global.fastest_time_boss5
	or global.fastest_time_boss5 = 0) and global.current_time_elapsed_boss5 > 100
	and room = room_boss_3 { //boss 5
		global.fastest_time_boss5 = global.current_time_elapsed_boss5;
		global.new_best_split = global.current_time_elapsed_boss5;
		scr_Save_Real("fastest_time_boss5",global.fastest_time_boss5);
		instance_create_depth(x,y,depth,obj_newbest_split)
	}

	time_stopped = true;
}