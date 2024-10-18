/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

double = true;

normal_sprite = spr_cubelaserenemy2;
flipped_sprite = spr_cubelaserenemy2_flipped;

vspd = 0;

random_set_seed(global.seed + global.enemy_number);
blue = choose(true,true,false);
if blue = true {
	instance_destroy();
	instance_create_depth(x,y,depth,obj_cubeenemy);
	random_set_seed(global.seed);
}
random_set_seed(global.seed);