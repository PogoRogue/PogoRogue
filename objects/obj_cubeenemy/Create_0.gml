/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

angle = 0;
rotation_dir = 1;
rotating = true;
image_index = 0;
dir_changed = false;

hp = 10; 
hp_max = hp;
hp_percent = (hp / hp_max) * 100;

bullet_defense = 0.7;

y_spd = 0;

grav = 0.21;
vspd = 0;

laser_obj = noone;
laser_obj2 = noone;

double = false;

normal_sprite = spr_cubelaserenemy;
flipped_sprite = spr_cubelaserenemy_flipped;

alarm[2] = 1;
rot_spd = 2;

sound = audio_play_sound(snd_nothing,0,false);