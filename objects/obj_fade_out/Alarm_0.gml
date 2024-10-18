/// @description go to next room
instance_destroy();
instance_create_depth(x,y,depth,obj_fade_in);

if next_room = room_tutorial and room = room_starting_area or next_room = room_proc_gen_test and room = room_starting_area
or next_room = room_credits or room = room_tutorial and next_room = room_starting_area 
or next_room = room_menu{
	instance_deactivate_all(false);	
	instance_activate_object(obj_steam);
}

if room = room_shop {
	global.show_tips_screen = false;	
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
	instance_activate_object(obj_steam);
}

global.room_width = 768;
global.room_height = 432;
camera_set_view_size(view_camera[0],global.room_width,global.room_height);