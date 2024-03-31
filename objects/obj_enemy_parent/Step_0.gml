/// @description Handle death

if(is_dead) {
	image_alpha *= 0.9;
	mask_index = spr_nothing;
	spd = 0;
	speed = 0;
	if image_alpha <= 0.005 {
		instance_destroy();	
	}
} else if (hp <= 0) {
	alarm_set(0, room_speed);
	audio_play_sound(snd_enemyhurt,0,false);
	
	//screen shake
	scr_Screen_Shake(6, 10, false);
	
	//combo
	global.combo += 1;
	global.combo_length = global.combo_max;
	if global.combo = 10 and global.combo_master = true { //combo master powerup
		with obj_player {
			if hp < max_hp {
				hp += 8;
				with obj_player_health {
					heart_gain_num = other.hp;	
				}
			}
		}
	}
	
	// Room kill counter
	obj_player.enemies_killed += 1;
	
	//create coins and items
	var center_x = x - sprite_get_xoffset(sprite_index) + ((sprite_width / 2)*image_xscale);
	var center_y = y - sprite_get_yoffset( sprite_index) + sprite_height / 2;
	if drop_coins = true {
		with instance_create_depth(center_x,center_y,depth-1,obj_coin_spawner) {
			if global.combo < global.combo_max_coins {
				num_of_coins = global.combo + global.added_coins;
			}else {
				num_of_coins = global.combo_max_coins + global.added_coins;
			}
			if(global.robbery == true and obj_player.landed_on_enemy == true){
				num_of_coins *= 2;
				obj_player.landed_on_enemy = false;
			}
		}
	}
	
	if (created_items = false) {
		scr_Random_Item_Drops();
		created_items = true;
	}
	
	//aerial assassin buff
	with obj_player {
		if global.aerial_assassin = true {
			aerial_assassin_count += 1;	
			if aerial_assassin_count >= 2 {
				global.combo += 1;
				aerial_assassin_count = 0;
			}
		}
	}
	
	with obj_player {
		if pickups_array[0].enemies_count_max > 0 and pickups_array[0].enemies_count > 0 {
			pickups_array[0].enemies_count -= 1;
		}
		if pickups_array[1].enemies_count_max > 0 and pickups_array[1].enemies_count > 0 {
			pickups_array[1].enemies_count -= 1;
		}
	}
	
	is_dead = true;
	mask_index = spr_nothing;
}

// Update iframes
current_iframes = max(current_iframes - 1, 0);

// Update red shader frames
red_frames = max(red_frames - 1, 0);
