// Inherit the parent event
event_inherited();

if instance_exists(obj_player) and room != room_shop {
	if pickup = obj_player.pickup_1 or pickup = obj_player.pickup_2 
	or synergy_item = obj_player.pickup_1 or synergy_item = obj_player.pickup_2 {
		instance_destroy();
		if room != room_shop {
			with instance_create_depth(x,y,depth-2,obj_item_parentpickup) {
				follow_player = false;
				alarm[0] = 1;
			}
		}
	}
}