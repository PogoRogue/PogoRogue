/// @description Insert description here
// You can write your code in this editor

if (obj_player.enemies_killed_in_room >= enemies_required and obj_player.enemies_killed_in_room != 0 or enemies_required) {
	obj_player.enemies_killed_in_room = 0;
	instance_destroy();
}
	
