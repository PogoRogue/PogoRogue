/// @description Instantiate variables

// Inherit the parent event
event_inherited();

//drop chances
heart_chance = 0; //percent
buff_chance = 0; //percent
pickup_chance = 0; //percent
weapon_chance = 0; //percent

// Layer in front of boss (-5)
depth = -6;

boss = instance_nearest(x, y, parent);
draw_hp = false;

// Position and rotation variables
boss_dir = point_direction(x, y, boss.x, boss.y);
boss_dir = degtorad(boss_dir);
dist = point_distance(x, y, boss.x, boss.y);
rad = degtorad(image_angle);
wobble = 0;

drop_coins = false;

explode = false;
red_alpha = 0;

spawned = false;
white_alpha = 0;