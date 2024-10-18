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
on_time = 2;
off_time = 5;
powering_up_time = 1;
damage = 4;
is_active = true;
alarm[5] = room_speed * initial_delay;

laser_obj = noone;

sound = audio_play_sound(snd_nothing,0,false);

heart_chance = 0;
buff_chance = 0;
weapon_chance = 0;
pickup_chance = 0;