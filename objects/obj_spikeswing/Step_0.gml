//swing
angle_accelerration = swingspeed * dcos(angle);
     
angle_velocity += angle_accelerration;
angle += angle_velocity;

if(!is_active) {
	angle_accelerration = 0;
	angle_velocity = 0;
	angle = lerp(angle, 0, 0.1); //0.05
	mask_index = spr_nothing;
} else {
	mask_index = sprite_index;
}

var new_x = anchor_x + lengthdir_x(distance, angle);
var new_y = anchor_y + lengthdir_y(distance, angle);

hsp = new_x - x;
vsp = new_y - y;

x += hsp;
y += vsp;

image_angle = angle + 90 + (additional_momentum * sign(angle_velocity));

if (image_angle > 355 and image_angle <= 365 
or image_angle > -5 and image_angle <= 5)
and sound_played = false {
	if scr_In_Camera_View(128) and !audio_is_playing(snd_wreckingball_woosh) {
		audio_play_sound(snd_wreckingball_woosh,0,false);
		sound_played = true;
		alarm[1] = 60;
	}
}