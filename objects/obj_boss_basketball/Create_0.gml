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

spike_mode = false;
spin_mode = false;
last_spin_speed = 0;
temp_spin_speed = 0;
shot_spikes = false;
shoot_delay = 5;
prev_spd2 = 0;

current_ball_num = 0;

randomize();
if size = 4 {
	hp = 96;
	grow_spikes = false;
}else if size = 3 {
	hspeed = random_range(-4,4);
	vspeed = random_range(-4,4);
	hp = 48;
	//spike
	instance_create_depth(x,y,depth+2,obj_boss_soccer_spike,{parent_index: other});
}else if size = 2 {
	hspeed = random_range(2,4) * choose(-1,1);
	vspeed = random_range(-2,2);
	if ball_index = 1 {
		alarm[3] = 300;
	}else {
		alarm[3] = 600;
	}
	hp = 24;
	
	//get ball number
	global.num_of_volleyballs += 1;
	current_ball_num = global.num_of_volleyballs;
}else if size = 1 {
	hspeed = random_range(-4,4);
	vspeed = random_range(-4,4);
	hp = 12;
	if ball_index = 1 {
		alarm[3] = 300;
	}else {
		alarm[3] = 600;
	}
	//get ball number
	global.num_of_tennisballs += 1;
	current_ball_num = global.num_of_tennisballs;
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
rot_speed = 0;
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

prev_spd = 0;
prev_dir = 0;

launched_num = 0;
slow_down = false;

hoop_array = [0,0,0];
hoop1_colliding = false;
hoop2_colliding = false;
hoop3_colliding = false;
above_hoop = false;
between_basket = false;