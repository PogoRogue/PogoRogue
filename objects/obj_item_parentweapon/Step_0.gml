// Inherit the parent event
event_inherited();

if instance_exists(obj_player) and room != room_shop {
	if weapon = obj_player.gun_1 or weapon = obj_player.gun_2 or weapon = obj_player.gun_3 {
		instance_destroy();
		if room != room_shop {
			with instance_create_depth(x,y,depth-2,obj_item_parentweapon) {
				follow_player = false;
				alarm[0] = 1;
			}
		}
	}
}