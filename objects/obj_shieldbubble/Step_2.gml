/// @description track player position

if instance_exists(obj_player) {
	if bouncing = false {
		x = obj_player.x;
		y = obj_player.y;
		bounce_x = x;	
		bounce_y = y;
	}else {
		obj_player.x = bounce_x;
		obj_player.y = bounce_y;	
	}
}

with obj_shieldbubble_mask {
	if instance_exists(parent_obj) {
		x = parent_obj.x;
		y = parent_obj.y;
	}else {
		instance_destroy();	
	}	
}

with obj_shieldbubble_mask2 {
	if instance_exists(parent_obj) {
		x = parent_obj.x;
		y = parent_obj.y;
	}else {
		instance_destroy();	
	}	
}