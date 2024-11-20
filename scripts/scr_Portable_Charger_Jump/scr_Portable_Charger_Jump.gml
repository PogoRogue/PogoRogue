// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Portable_Charger_Jump(){
	for (ii = 0; ii <= 1; ii++) {
		//portable charger passive
		if global.portablecharger {
			if pickups_array[ii].synergy_equipped = true {
				if pickups_array[ii].is_synergy = true {
					var item1 = scr_Convert_Sprite_To_Active(pickups_array[ii].base_item_sprite_1);
					var item2 = scr_Convert_Sprite_To_Active(pickups_array[ii].base_item_sprite_2);
						
					if item1.on_cooldown and item1.reload_on_bounce = true and item1 != pickup_jetpack {
						item1.bounce_reset -= 1;
					
						if item1.bounce_reset <= 0 {
							item1.uses_per_bounce = item1.max_uses_per_bounce;
							item1.cooldown_time = item1.max_cooldown_time;
							item1.on_cooldown = false;
							item1.bounce_reset = item1.bounce_reset_max;
				
							if item1 != pickup_hatgun and item1 != pickup_grappling 
							and item1 != pickup_harpoon {
								audio_play_sound(snd_recharge1,0,false);
							}
						}
					}else if item1.on_cooldown and item1.reload_on_bounce = true { //jetpack
						if global.impatience = false {
							item1.cooldown_time += item1.max_cooldown_time/4;
						}else {
							item1.cooldown_time += item1.max_cooldown_time/3;
						}
						if item1.cooldown_time > item1.max_cooldown_time {
							item1.cooldown_time = item1.max_cooldown_time;
						}	
					}
				
					if item2.on_cooldown and item2.reload_on_bounce = true and item2 != pickup_jetpack {
						item2.bounce_reset -= 1;
					
						if item2.bounce_reset <= 0 {
							item2.uses_per_bounce = item2.max_uses_per_bounce;
							item2.cooldown_time = item2.max_cooldown_time;
							item2.on_cooldown = false;
							item2.bounce_reset = item2.bounce_reset_max;
				
							if item2 != pickup_hatgun and item2 != pickup_grappling 
							and item2 != pickup_harpoon {
								audio_play_sound(snd_recharge1,0,false);
							}
						}
					}else if item2.on_cooldown and item2.reload_on_bounce = true { //jetpack
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
					if ii = 0 {
						var item1 = scr_Convert_Sprite_To_Active(global.parent_synergy1.gui_sprite);
						if pickups_array[ii] = global.item_1_pickup {
							var item2 = scr_Convert_Sprite_To_Active(global.parent_synergy1.base_item_sprite_2);
						}else if pickups_array[ii] = global.item_2_pickup {
							var item2 = scr_Convert_Sprite_To_Active(global.parent_synergy1.base_item_sprite_1);
						}
					}else {
						var item1 = scr_Convert_Sprite_To_Active(global.parent_synergy2.gui_sprite);
						if pickups_array[ii] = global.item_3_pickup {
							var item2 = scr_Convert_Sprite_To_Active(global.parent_synergy2.base_item_sprite_2);
						}else if pickups_array[ii] = global.item_4_pickup {
							var item2 = scr_Convert_Sprite_To_Active(global.parent_synergy2.base_item_sprite_1);
						}
					}
						
					if item1.on_cooldown and item1.reload_on_bounce = true and item1 != pickup_jetpack {
						item1.bounce_reset -= 1;
					
						if item1.bounce_reset <= 0 {
							item1.uses_per_bounce = item1.max_uses_per_bounce;
							item1.cooldown_time = item1.max_cooldown_time;
							item1.on_cooldown = false;
							item1.bounce_reset = item1.bounce_reset_max;
				
							if item1 != pickup_hatgun and item1 != pickup_grappling 
							and item1 != pickup_harpoon {
								audio_play_sound(snd_recharge1,0,false);
							}
						}
					}else if item1.on_cooldown and item1.reload_on_bounce = true { //jetpack
						if global.impatience = false {
							item1.cooldown_time += item1.max_cooldown_time/4;
						}else {
							item1.cooldown_time +=item1.max_cooldown_time/3;
						}
						if item1.cooldown_time > item1.max_cooldown_time {
							item1.cooldown_time = item1.max_cooldown_time;
						}	
					}
					if item2.on_cooldown and item2.reload_on_bounce = true and item2 != pickup_jetpack {
						item2.bounce_reset -= 1;
					
						if item2.bounce_reset <= 0 {
							item2.uses_per_bounce = item2.max_uses_per_bounce;
							item2.cooldown_time = item2.max_cooldown_time;
							item2.on_cooldown = false;
							item2.bounce_reset = item2.bounce_reset_max;
				
							if item2 != pickup_hatgun and item2 != pickup_grappling 
							and item2 != pickup_harpoon {
								audio_play_sound(snd_recharge1,0,false);
							}
						}
					}else if item2.on_cooldown and item2.reload_on_bounce = true { //jetpack
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