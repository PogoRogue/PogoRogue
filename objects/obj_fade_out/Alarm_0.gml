/// @description go to next room
instance_destroy();
instance_create_depth(x,y,depth,obj_fade_in);

if next_room = room_proc_gen_test and room = room_starting_area
or next_room = room_tutorial and room = room_starting_area {
	instance_deactivate_all(false);	
}


room = next_room;

with obj_player {
	image_yscale = 1;
	image_xscale = 1;
	mask_index = sprite_index;
	obj_player_mask.mask_index = obj_player_mask.sprite_index;
	state = state_free;	
}

if next_room = room_menu {
	instance_deactivate_all(false);	
}
