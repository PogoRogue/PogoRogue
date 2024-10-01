/// @description go to next room
if room = room_shop {
	global.show_tips_screen = false;	
}

room = room_menu;

with obj_player {
	image_yscale = 1;
	image_xscale = 1;
	mask_index = sprite_index;
	obj_player_mask.mask_index = obj_player_mask.sprite_index;
	state = state_free;	
}

room_persistent = false;


instance_deactivate_all(false);	

global.room_width = 768;
global.room_height = 432;
camera_set_view_size(view_camera[0],global.room_width,global.room_height);