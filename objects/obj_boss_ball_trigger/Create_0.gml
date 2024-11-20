/// @description Instantiate variables

sprite_index = spr_nothing;
mask_index = spr_nothing;

draw_cutin = false;
triggered = false;
player_freed = false;

screen_width = 768;
screen_height = 432;

lerp_destination = 0.0;

alpha = 0;
alpha_lerp_speed = 0.01;

backdrop_scale = 0.0;
backdrop_lerp_speed = 0.05;

text_scale = 0.0;
text_lerp_speed = 0.02;

free = false;

alarm[2] = 100;

alarm[3] = 120;

global.num_of_volleyballs = 0;
global.num_of_tennisballs = 0;

global.basketball_health = 96;
global.soccer_health1 = 48;
global.soccer_health2 = 48;
global.volleyball_health1 = 24;
global.volleyball_health2 = 24;
global.volleyball_health3 = 24;
global.volleyball_health4 = 24;
global.tennis_health1 = 12;
global.tennis_health2 = 12;
global.tennis_health3 = 12;
global.tennis_health4 = 12;
global.tennis_health5 = 12;
global.tennis_health6 = 12;
global.tennis_health7 = 12;
global.tennis_health8 = 12;

global.max_ball_health = (global.basketball_health + global.soccer_health1 + global.soccer_health2 +
global.volleyball_health1 + global.volleyball_health2 + global.volleyball_health3 + global.volleyball_health4 +
global.tennis_health1 + global.tennis_health2 + global.tennis_health3 + global.tennis_health4 + 
global.tennis_health5 + global.tennis_health6 + global.tennis_health7 + global.tennis_health8);

//instance_create_layer(512+32, 272+128, "enemies", obj_boss_sphere);