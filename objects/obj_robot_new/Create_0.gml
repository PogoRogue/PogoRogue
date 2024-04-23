/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Stats
player = instance_nearest(x, y, obj_player);
range = 200;
grav = 0.21;
on_ground = place_meeting(x, y + 1, obj_ground_parent);
walk_speed = 0.75;
x_dir = 1;
jump_speed = 2;
jump_height = -6;
jump_cooldown = room_speed;
at_edge = false;

enum ROBOT_NEW_STATES {
	IDLE,
	WALKING,
	JUMPING,
}

// State info
current_state = ROBOT_STATES.WALKING;
previous_state = current_state;
state_has_changed = false;
has_jumped = false;
