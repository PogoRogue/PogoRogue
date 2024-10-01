/// @description Floor On

power_on = true;
//sprite_index = spr_electric_current_on;
alarm[2] = round(room_speed * on_time);
if room != room_proc_gen_test {
	laser_obj = instance_create_depth(x,y,depth-1,obj_laser_boss);
	sound = audio_play_sound(snd_laser_hazard,0,false);
}