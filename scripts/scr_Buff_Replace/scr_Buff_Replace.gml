// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Buff_Replace() {
	if room = room_shop or created_in_room = true {
		for (j = 0; j < array_length(global.all_buff_sprites); j++) {
			if (sprite_index = global.all_buff_sprites[j] and global.all_buff_numbers[j] >= max_uses and max_uses != 0) {
				sold_out = true;
			}
		}
	}else if follow_player = true and salesman = false {
		for (j = 0; j < array_length(global.all_buff_sprites); j++) {
			if (sprite_index = global.all_buff_sprites[j] and global.all_buff_numbers[j] >= max_uses and max_uses != 0) {
				sold_out = true;
				instance_destroy();
				with instance_nearest(x,y,obj_chest) {
					num_of_coins = irandom_range(min_num_of_coins,max_num_of_coins);
					create_coins = true;
					alarm[0] = 1;
				}
			}
		}
	}
}