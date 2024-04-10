/// @description Instantiate variables

// Inherit the parent event
event_inherited();

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