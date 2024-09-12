/// @description shrink
randomize();
alarm[1] = 6;
random_set_seed(global.seed);
if sprite_index = spr_plasma_trail8 {
	sprite_index = spr_plasma_trail7;
}else if sprite_index = spr_plasma_trail7 {
	sprite_index = spr_plasma_trail6;
}else if sprite_index = spr_plasma_trail6 {
	sprite_index = spr_plasma_trail5;
}else if sprite_index = spr_plasma_trail5 {
	sprite_index = spr_plasma_trail4;
}else if sprite_index = spr_plasma_trail4 {
	sprite_index = spr_plasma_trail3;
}else if sprite_index = spr_plasma_trail3 {
	sprite_index = spr_plasma_trail2;
}else if sprite_index = spr_plasma_trail2 {
	sprite_index = spr_plasma_trail1;
}else if sprite_index = spr_plasma_trail1 {
	instance_destroy();
}