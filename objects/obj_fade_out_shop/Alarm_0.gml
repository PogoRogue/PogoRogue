/// @description go to next room
room = global.last_room;
room_persistent = false;
global.player_spawn_x = global.player_spawn_x_prev;
global.player_spawn_y = global.player_spawn_y_prev;

with obj_player {
	state = state_free;
	image_xscale = 1;
	image_yscale = 1;
}