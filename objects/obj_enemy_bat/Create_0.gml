/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

perching = true;
falling = false;
hp = 6;
hp_max = hp;
grav = 0.21;
vspd = 0;

randomize();
follow_spd = random_range(1.5,3);
current_spd = 0;
random_set_seed(global.seed);