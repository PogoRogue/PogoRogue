/// @description shoot spikes

if freeze = true or place_meeting(x,y,obj_basketball_hoop_large_mask_left) {
	alarm[4] = 1;
	exit;
}


spin_mode = true;
if size = 4 {
	audio_play_sound(snd_basketball_charge,0,false);
}
temp_spin_speed = hspeed;
if abs(temp_spin_speed) < 3 {
	temp_spin_speed = sign(temp_spin_speed) * 3;
}
if temp_spin_speed = 0 {
	temp_spin_speed = 3;
}
last_spin_speed = temp_spin_speed;
prev_spd = speed;
prev_dir = direction;