/// @description initialize variables
parent_index = instance_nearest(x,y,obj_player);
other2 = noone;
new_alpha = 1;
despawn = false;
reached_max_alpha = false;
chargejump = false;
megabounce = false;
despawnable = false;
alarm[1] = 2;
reset = false;

damage = 12;

damaged_list = array_create(100, noone);
init_angle = obj_player.angle;
alarm[0] = 60;
alarm[2] = 20;
particle_spawn_gap = 1;
alarm[3] = 1;
scr_Create_Flames();
released = false;

audio_play_sound(snd_dragster,0,false);

depth = obj_player.depth + 8;