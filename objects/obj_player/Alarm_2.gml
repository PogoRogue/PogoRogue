if room != room_shop {
	//instance_create_depth(x,y,depth+1,obj_shop_door);
	instance_create_depth(x,y-54,depth+1,obj_item_buff_bartime);
	instance_create_depth(x,y-70,depth+1,obj_item_buff_righteousrevenge);
	instance_create_depth(x,y-86,depth+1,obj_item_buff_aerialassassin);
	instance_create_depth(x,y-102,depth+1,obj_item_buff_bartime);
}
//instance_create_depth(x+48,y-128,depth+1,obj_boss_door);

/// @description create text in proc gen room
//temporarily disabled 
/*
while(!place_meeting(x,y+32,obj_ground) and !place_meeting(x,y+32,obj_ground_oneway)) {
	y++;	
}*/
if room = room_proc_gen_test || room = room_sprite_level_test {
	//instance_create_depth(x-64,y-64,depth+100,obj_room_title);
	instance_create_depth(x,y-54,depth+1,obj_item_buff_bartime);
}