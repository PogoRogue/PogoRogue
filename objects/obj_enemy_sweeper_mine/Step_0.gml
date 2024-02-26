/// @description Insert description here
// You can write your code in this editor
event_inherited();
if (place_meeting(x, y, obj_player) || place_meeting(x, y, obj_projectile)) {
	if (alarm[1] < 0) {
		alarm_set(1, 3 * room_speed); 
		}
}




