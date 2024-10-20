if room = room_shop {
	created_in_room = true;	
}

if (follow_player = true and obj_player.state != obj_player.state_blink and obj_player.state != obj_player.state_strike) {
	move_towards_point(obj_player.x,obj_player.y,speed);
	speed = lerp(speed,8,0.05);	
	image_alpha = 1;
	mask_index = sprite_index;
}else if obj_player.state != obj_player.state_blink and obj_player.state != obj_player.state_strike {
	if room != room_shop and created_in_room = false {	
		image_alpha = 0;
		mask_index = spr_nothing;
	}else {
		image_alpha = 1;
		if room = room_shop {
			mask_index = sprite_index;
		}else {
			mask_index = spr_nothing;
		}
	}
}else {
	speed = 0;
	mask_index = sprite_index;
}

if show_debug = true {
	//show_debug_message(string(x) + " " +string(y) + " ");	
	//show_debug_message(string(object_get_name(object_index)));	
	if object_get_name(object_index) = "obj_item_parentbuff" {
		alarm[0] = 1;
	}
	show_debug = false;
}

if point_distance(x,y,obj_player.x,obj_player.y) > 2000 and room != room_shop and created_in_room = false {
	instance_destroy();	
	show_debug_message("weapon destroyed! 5 " + string(object_get_name(object_index)));
}

//show_debug_message("Item X: " + string(x) + " Item Y: " + string(y));