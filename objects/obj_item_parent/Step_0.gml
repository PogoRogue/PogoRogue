if (follow_player = true and obj_player.state != obj_player.state_blink) {
	move_towards_point(obj_player.x,obj_player.y,speed);
	speed = lerp(speed,8,0.05);	
	image_alpha = 1;
	mask_index = sprite_index;
}else if obj_player.state != obj_player.state_blink {
	if room != room_shop {	
		image_alpha = 0;
		mask_index = spr_nothing;
	}else {
		image_alpha = 1;
		mask_index = sprite_index;
	}
}else {
	speed = 0;
}

if show_debug = true {
	//show_debug_message(string(x) + " " +string(y) + " ");	
	//show_debug_message(string(object_get_name(object_index)));	
	if object_get_name(object_index) = "obj_item_parentbuff" {
		alarm[0] = 1;
	}
	show_debug = false;
}