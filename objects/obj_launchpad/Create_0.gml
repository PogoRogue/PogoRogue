/// @description Insert description here
// You can write your code in this editor

vspd = 2;
spawned = true;
flames_index = 0;
y_add = 0; //bob this amount of pixels
y_add_spd_start = 0.2; 
y_add_spd = y_add_spd_start; //bob at this speed
y_up = true; //bobbing up or down
alpha = 0;
animating = false;
missiles_left = 2;
scale = 0;
created_walls = false;

sprite_index = spr_launchpad_white;
//mask_index = spr_nothing;
image_index = 0;
image_speed = 0;

not_meeting = false;

topleft_corner = noone;
topright_corner = noone;
bottomleft_corner = noone;
bottomright_corner = noone;
rocket_1 = noone;
rocket_2 = noone;
rockets_spawned = false;
not_meeting_enemy = true;