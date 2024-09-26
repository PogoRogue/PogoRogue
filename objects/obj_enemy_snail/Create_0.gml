/// @description Instantiate variables

// Inherit the parent event
event_inherited();

if(!instance_exists(obj_slime_outline)) {
	instance_create_layer(0, 0, "enemies", obj_slime_outline);
}

enum SNAIL_STATES {
	HORIZONTAL,
	VERTICAL_LEFT,
	VERTICAL_RIGHT,
}


state = SNAIL_STATES.HORIZONTAL;
alarm[3] = 1;

// Instantiate additional variables
depth = 5;
spd = 0.5;
at_edge = false;
at_wall = false;

hp_max = 16;
hp = hp_max;
stomp_defense = 0.9;

randomize();
if global.phase <= 1 {
	//red = false;
	pink = choose(true,false);
}else if global.phase = 2 {
	red = choose(true,false);
}else if global.phase >= 3 {
	red = choose(true,false);
	if red = false {
		pink = true;
	}
}
if red = true {
	sprite_index = spr_enemy_snail_red;
}
if pink = true {
	sprite_index = spr_enemy_snail_pink;
}
random_set_seed(global.seed);