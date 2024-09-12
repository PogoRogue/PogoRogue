/// @description track
if track_y = true {
	if instance_exists(parent_index) {
		if room = room_tutorial {
			x = parent_index.x;
		}
		y = parent_index.y + parent_yoffset;	
	}
}

//constrain player
if constrain_player = true {
	obj_player.table = true;
	obj_player.can_rotate = false;
}