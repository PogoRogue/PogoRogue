//increase time
if instance_exists(obj_player) {
	with obj_pause {
		if pause = false and obj_player.dead = false {
			global.current_time_elapsed += 1;
		}
	}
}

//add items

//weapons
with obj_player {
	if scr_In_Array(global.all_weapons_used,gun_1.sprite) = false {
		array_resize(global.all_weapons_used,array_length(global.all_weapons_used)+1);
		global.all_weapons_used[array_length(global.all_weapons_used)-1] = gun_1.sprite;
	}
	if scr_In_Array(global.all_weapons_used,gun_2.sprite) = false {
		array_resize(global.all_weapons_used,array_length(global.all_weapons_used)+1);
		global.all_weapons_used[array_length(global.all_weapons_used)-1] = gun_2.sprite;
	}
	if scr_In_Array(global.all_weapons_used,gun_3.sprite) = false {
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