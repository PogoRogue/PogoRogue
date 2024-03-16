/// @description pickup drop
if random_pickup = true {
	scr_Random_Item_Drops();	
}else {
	var center_x = x;
	var center_y = y - sprite_get_yoffset( sprite_index) + sprite_height / 2;
	with instance_create_depth(center_x,center_y,depth-2,custom_pickup_drop) {
		follow_player = true;
	}	
}