/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

airbag = true;
vspd = 4;
spawned = false;
propeller_index = 0;
y_add = 0; //bob this amount of pixels
y_add_spd_start = 0.2; 
y_add_spd = y_add_spd_start; //bob at this speed
y_up = true; //bobbing up or down

sprite_index = spr_airbag_spawning;
mask_index = spr_nothing;
image_index = 0;
image_speed = 0;

not_meeting = false;
heart_increased = false;