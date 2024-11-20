/// @description Insert description here
// You can write your code in this editor
if firing_cooldown  = false and snowball_freeze = false {
	if(current_state == ROBOT_STATES.IDLE) {
		current_state = ROBOT_STATES.WALKING;
	}
}else {
	alarm[2] = 1;	
}