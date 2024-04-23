/// @description Instantiate variables and create shield

// Inherit the parent event
event_inherited();

depth = -7;

spd = 0;

// Create shield object
shield = instance_create_depth(x, y, depth-1, obj_shield_respawning);
shield.parent = self;

explode = false;
red_alpha = 0;

temp_hp = hp;
immune = false;