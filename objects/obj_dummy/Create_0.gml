/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

red_frames = 0;
shaded = false;
hp = 100;
damage = 0;

//update center position
center_xs_sprite = bbox_left + ((bbox_right - bbox_left)/2);
center_y_sprite = bbox_top + ((bbox_bottom - bbox_top)/2);

reload = false;

heart_chance = 0;
buff_chance = 0;
pickup_chance = 0;
weapon_chance = 0;