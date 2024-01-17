/// @description Rotate and move back and forth





// Inherit the parent event
event_inherited();

image_angle -= rotation_spd;

if(is_dead) {
	spd = 0;	
} else if (place_meeting(x + speed, y, obj_ground)) {
	spd *= -1;
	image_xscale = sign(spd);
}

x += spd;