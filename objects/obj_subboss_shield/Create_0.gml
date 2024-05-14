/// @description Instantiate variables and create shield

// Inherit the parent event
event_inherited();

depth = -9;

drop = false;

boss = instance_nearest(x, y, parent);

// Position and rotation variables
boss_dir = point_direction(x, y, boss.x, boss.y);
boss_dir = degtorad(boss_dir);
dist = 180;
new_x = x;
new_y = y;
rad = degtorad(image_angle);

// Create shield object
shield = instance_create_depth(x, y, depth-1, obj_shield_respawning);
shield.parent = self;

drop_coins = false;
created_items = true;

explode = false;
red_alpha = 0;

image_xscale = -1;

temp_hp = hp;
immune = false;