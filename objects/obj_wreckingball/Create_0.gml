depth = obj_player.depth-1;
	
enemies_array = [];
grapple_x = obj_player.x;
grapple_y = obj_player.y;
rope_x = x;
rope_y = y;
rope_angle_velocity = 0;
rope_angle = point_direction(grapple_x,grapple_y,x,y);
rope_length = 32; //point_distance(grapple_x,grapple_y,x,y);
rope_length_max = 128;
hspd = 0;
vspd = 0;
retract = false;
can_retract = false;
grav = 0.21;

vspd = 0;

added_spd = 0; //from player rotating
turn_spd = 0.02;

held_time_right = 0;
held_time_left = 0;

held_right = false;
held_left = false;

spinning = false;
spinning_right = false;

fric = 0.5; //friction
damage = 14;
enemies_array = [];
sound_playable = true;

arrows_alpha = 1.5;
moved = false;

audio_play_sound(snd_wreckingball_spawn,0,false);