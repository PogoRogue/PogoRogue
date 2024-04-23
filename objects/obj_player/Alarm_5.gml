if room = room_tutorial {
	with instance_create_depth(x,y+20000,depth,obj_item_buff_revive) {
		event_user(0);
	}
	instance_destroy(instance_nearest(x,y,obj_item_buff_revive));
}