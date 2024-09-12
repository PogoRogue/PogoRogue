if parent_index.grv = 0 {
	parent_index.grv = parent_index.init_grv;
}
obj_player.rotation_speed = obj_player.original_rotation_speed;

var prev_x = x;
var prev_y = y;
for(i = 0; i < 20; i+= 4) {
	x = x + lengthdir_x(i,image_angle+90);
	y = y + lengthdir_y(i,image_angle+90);
	scr_Create_Flames();
}

with obj_flames_particle {
	if image_index <= 1 {
		image_index  = 2;
	}
}

if audio_is_playing(snd_dragster) {
	audio_stop_sound(snd_dragster);	
}