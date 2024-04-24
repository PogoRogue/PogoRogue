/// @description Instantiate variables

// Inherit the parent event
event_inherited();

// Instantiate additional variables
/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Stats
walk_speed = 0.75;
x_dir = 1;
at_edge = false;

// State info
current_state = ROBOT_STATES.WALKING;
previous_state = current_state;
state_has_changed = false;
