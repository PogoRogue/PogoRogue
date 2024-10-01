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

mask_index = spr_pickup_airbag;

if (room = room_boss_1 or room = room_boss_2 or room = room_boss_2) {
	//instance_destroy();
	follow_player = false;
	
	mask_index = spr_nothing;
	image_alpha = 0;
}else if created_in_room = true and room = room_proc_gen_test {
	follow_player = false;
	mask_index = spr_nothing;
	if distance_to_object(obj_salesman_table) > 400 {
		image_alpha = 0;
	}
}else {
	image_alpha = 1;
	mask_index = spr_pickup_airbag;
}