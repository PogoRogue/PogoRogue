/// @description Instantiate variables and create shield

// Inherit the parent event
event_inherited();

depth = -11;

drop = false;

boss = instance_nearest(x, y, parent);

// Position and rotation variables
boss_dir = point_direction(x, y, boss.x, boss.y);
boss_dir = degtorad(boss_dir);
new_x = x;
new_y = y;
rad = degtorad(image_angle);

// Create shield object
//shield = instance_create_depth(x, y, depth-1, obj_shield_respawning);
//shield.parent = self;

drop_coins = false;
created_items = true;

explode = false;
red_alpha = 0;

image_xscale = -1;

temp_hp = hp;
immune = false;

randomize();
rot_spd = random_range(0.008,0.015);
spd_mult = random_range(1,1.5);
dist = irandom_range(160,200);
random_set_seed(global.seed);

laser_alpha = 0;
laser_up = false;

initial_delay = 2;

power_on = false;
on_time = random_range(2,3.75);
off_time = random_range(2.5,5); //4
powering_up_time = 1;
damage = 4;
is_active = true;
alarm[5] = room_speed * initial_delay;

laser_obj = noone;

sound = audio_play_sound(snd_nothing,0,false);