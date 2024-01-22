// Inherit the parent event
event_inherited();

if instance_exists(obj_player) and room != room_shop {
	if weapon = obj_player.gun_1 or weapon = obj_player.gun_2 or weapon = obj_player.gun_3 {
		instance_destroy();
		if room != room_shop {
			with instance_nearest(x,y,obj_chest) {
				num_of_coins = irandom_range(min_num_of_coins,max_num_of_coins);
				create_coins = true;
				alarm[0] = 1;
			}
		}
	}
}