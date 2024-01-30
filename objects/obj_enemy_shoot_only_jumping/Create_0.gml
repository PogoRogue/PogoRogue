/// @description Instantiate variables

// Inherit the parent event
event_inherited();

is_grounded = false;
is_jumping = false;
player = instance_nearest(x, y, obj_player);
jump_range = 150;
jump_cooldown = 0;
cooldown_length = 3 * room_speed;
jump_height = -10;

spd = 0;
at_wall = false;
