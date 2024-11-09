/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

heart_chance = 0; //percent
buff_chance = 0; //percent
pickup_chance = 0; //percent
weapon_chance = 0; //percent

can_die = false;
alarm[1] = 30;

randomize();
if size = 4 {
	hp = 96;
}else if size = 3 {
	hspeed = random_range(-4,4);
	vspeed = random_range(-4,4);
	hp = 48;
}else if size = 2 {
	hspeed = random_range(-4,4);
	vspeed = random_range(-4,4);
	hp = 24;
}else if size = 1 {
	hspeed = random_range(-4,4);
	vspeed = random_range(-4,4);
	hp = 12;
}
random_set_seed(global.seed);

hp_max = hp;

hp_max = hp;
draw_hp = false;
stomp_defense = 1;
shoot_defense = 1;

// Healthbar dimensions
view_width = camera_get_view_width(view_camera[0]);
view_height = camera_get_view_height(view_camera[0]);
top_border = view_height - 20;
hp_percent = (hp / hp_max) * 100;

grav = 0.21;
scale = 1;
bounce_decay = 0.97;
alpha = 1;
rot_angle = 0;
free = true;
despawn = false;
damage = 0;

freeze = false;
megabounce_freeze = false; //dont despawn right away if killed by megabounce
freeze_x = x;
freeze_y = y;
freeze_frame = image_index;
died = false;
died2 = false;
death_x = x;
death_y = y;
next_direction = 0;
projectile_array = [];
init_hp = hp;

prev_hspeed = 0;
prev_vspeed = 0;