// Inherit the parent event
event_inherited();

if instance_exists(obj_player) and room != room_shop {
	if weapon = obj_player.gun_1 or weapon = obj_player.gun_2 or weapon = obj_player.gun_3 {
		instance_destroy();
		show_debug_message("weapon destroyed! 1 " + string(object_get_name(object_index)));
		if room != room_shop {
			
			with instance_create_depth(x,y,depth-2,obj_item_parentweapon,{slot_machine: slot_machine}) {
				follow_player = false;
				alarm[0] = 2;
				slot_machine = slot_machine;
			}
		}
	}
}

if (room = room_boss_1 or room = room_boss_2 or room = room_boss_3) and slot_machine = false {
	//instance_destroy();
	follow_player = false;
}

if slot_machine = true {
	follow_player = true;
}