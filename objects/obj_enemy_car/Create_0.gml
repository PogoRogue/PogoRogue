/// @description Instantiate variables

// Inherit the parent event
event_inherited();

// Instantiate additional variables
depth = 5;
spd = 2.5;
at_edge = false;
explosion_defense = 0.0;
mine_delay = room_speed * 2;
alarm_set(1, mine_delay);
x_dir = 1;

enum CAR_STATES {
	IDLE,
	DRIVING,
}

// State info
current_state = ROBOT_STATES.WALKING;
previous_state = current_state;
state_has_changed = false;

// Place on surface
while(!place_meeting(x, y + 1, obj_ground_parent)){
	y++;
}
while(place_meeting(x, y - 1, obj_ground_parent)){
	y--;
}
