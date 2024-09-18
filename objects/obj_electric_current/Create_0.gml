/// @description Create Electric Floor
power_on = false;
on_time = 2;
off_time = 2; //4
powering_up_time = 1;
damage = 4;
is_active = true;
alarm[3] = room_speed * initial_delay;
sound = audio_play_sound(snd_nothing,0,false);
if place_meeting(x-1,y,obj_ground) and !place_meeting(x+1,y,obj_ground) {
	image_xscale = 1;
}else if !place_meeting(x-1,y,obj_ground) and place_meeting(x+17,y,obj_ground) {
	image_xscale = -1;
	x += 16;
}else if place_meeting(x,y,obj_ground) {
	image_xscale = -1;
	x -= 16;
}



laser_obj = noone;
xx = 0;

laser_alpha = 0;
laser_up = false;