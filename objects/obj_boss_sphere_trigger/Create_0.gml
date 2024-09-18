/// @description Instantiate variables

sprite_index = spr_nothing;
mask_index = spr_trigger;

draw_cutin = false;
triggered = false;
player_freed = false;

screen_width = 720;
screen_height = 432;

lerp_destination = 0.0;

alpha = 0;
alpha_lerp_speed = 0.01;

backdrop_scale = 0.0;
backdrop_lerp_speed = 0.05;

text_scale = 0.0;
text_lerp_speed = 0.02;

free = false;

alarm[2] = 60;

instance_create_layer(272, 272, "enemies", obj_boss_sphere);