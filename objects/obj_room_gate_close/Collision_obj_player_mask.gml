/// @description Insert description here
// You can write your code in this editor

if (obj_player.enemies_killed >= obj_player.enemies_required) {
	obj_player.room_number += 1;
	obj_player.enemies_killed = 0;
	instance_destroy();
}
else if (obj_player.room_number == 0) {
	obj_player.room_number += 1;
	instance_destroy();	
}
	
