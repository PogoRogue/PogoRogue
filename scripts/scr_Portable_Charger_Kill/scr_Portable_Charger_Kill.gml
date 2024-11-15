// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Portable_Charger_Kill(kills) {
	with obj_player {
		for (j = 0; j <= 1; j++) {
			//portable charger passive
			if global.portablecharger {
				if pickups_array[j].synergy_equipped = true {
					if pickups_array[j].is_synergy = true {
						var item1 = scr_Convert_Sprite_To_Active(pickups_array[j].base_item_sprite_1);
						var item2 = scr_Convert_Sprite_To_Active(pickups_array[j].base_item_sprite_2);
						
						if item1.enemies_count_max > 0 and item1.enemies_count > 0 and item1 != pickup_jetpack {
							item1.enemies_count -= kills;
						}else if item1 = pickup_jetpack { //jetpack
							if global.impatience = false {
								item1.cooldown_time += item1.max_cooldown_time/4;
							}else {
								item1.cooldown_time += item1.max_cooldown_time/3;
							}
							if item1.cooldown_time > item1.max_cooldown_time {
								item1.cooldown_time = item1.max_cooldown_time;
							}	
						}
				
						if item2.enemies_count_max > 0 and item2.enemies_count > 0 and item2 != pickup_jetpack {
							item2.enemies_count -= kills;
						}else if item2 = pickup_jetpack { //jetpack
							if global.impatience = false {
								item2.cooldown_time += item2.max_cooldown_time/4;
							}else {
								item2.cooldown_time +=item2.max_cooldown_time/3;
							}
							if item2.cooldown_time > item2.max_cooldown_time {
								item2.cooldown_time = item2.max_cooldown_time;
							}	
						}
				
				
					}else {
						if j = 0 {
							var item1 = scr_Convert_Sprite_To_Active(global.parent_synergy1.gui_sprite);
							if pickups_array[j] = global.item_1_pickup {
								var item2 = scr_Convert_Sprite_To_Active(global.parent_synergy1.base_item_sprite_2);
							}else if pickups_array[j] = global.item_2_pickup {
								var item2 = scr_Convert_Sprite_To_Active(global.parent_synergy1.base_item_sprite_1);
							}
						}else {
							var item1 = scr_Convert_Sprite_To_Active(global.parent_synergy2.gui_sprite);
							if pickups_array[j] = global.item_3_pickup {
								var item2 = scr_Convert_Sprite_To_Active(global.parent_synergy2.base_item_sprite_2);
							}else if pickups_array[j] = global.item_4_pickup {
								var item2 = scr_Convert_Sprite_To_Active(global.parent_synergy2.base_item_sprite_1);
							}
						}
						
						if item1.enemies_count_max > 0 and item1.enemies_count > 0 and item1 != pickup_jetpack {
							item1.enemies_count -= kills;
						}else if item1 = pickup_jetpack { //jetpack
							if global.impatience = false {
								item1.cooldown_time += item1.max_cooldown_time/4;
							}else {
								item1.cooldown_time +=item1.max_cooldown_time/3;
							}
							if item1.cooldown_time > item1.max_cooldown_time {
								item1.cooldown_time = item1.max_cooldown_time;
							}	
						}
						if item2.enemies_count_max > 0 and item2.enemies_count > 0 and item2 != pickup_jetpack {
							item2.enemies_count -= kills;
						}else if item2 = pickup_jetpack { //jetpack
							if global.impatience = false {
								item2.cooldown_time += item2.max_cooldown_time/4;
							}else {
								item2.cooldown_time += item2.max_cooldown_time/3;
							}
							if item2.cooldown_time > item2.max_cooldown_time {
								item2.cooldown_time = item2.max_cooldown_time;
							}	
						}
					}
				}
			}
		}
	}
}