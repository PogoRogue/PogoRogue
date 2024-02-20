/// @description Rotate and move back and forth

image_angle -= rotation_spd;

if(is_dead) {
	spd = 0;	
} else if (place_meeting(x + speed, y, obj_ground)) {
	spd *= -1;
	image_xscale = sign(spd);
}

x += spd;

// If surrounded, brick cannot be damaged
if(instance_place_list(x, y, obj_boss_brick, ds_list_create(), false) >= 4) {
	hp = hp_max;
	is_dead = false;
}

// Inherit the parent event
event_inherited();