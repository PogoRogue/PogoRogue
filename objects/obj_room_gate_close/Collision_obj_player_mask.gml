/// @description Insert description here
// You can write your code in this editor

show_debug_message("obj_player_mask");
if (obj_player.enemies_killed_in_room >= enemies_required) {
	obj_player.enemies_killed_in_room = 0;
	instance_destroy();
}
	
