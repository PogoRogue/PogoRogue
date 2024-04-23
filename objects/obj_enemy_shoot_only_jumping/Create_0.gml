/// @description Instantiate variables

// Inherit the parent event
event_inherited();

is_grounded = false;
player = instance_nearest(x, y, obj_player);
jump_range = 200;
jump_cooldown = 0;
cooldown_length = 3 * room_speed;
jump_height = -7.5;

h_spd = 0;
at_wall = false;


