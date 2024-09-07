/// @description random drops
if always_spawn_passive == false {
	Create_Item_Drops(random_items);	
}else {
	var center_x = x;
	var center_y = y - sprite_get_yoffset( sprite_index) + sprite_height / 2;
	with instance_create_depth(center_x,center_y,depth-2,custom_passive_drop) {
		follow_player = true;
	}	
}