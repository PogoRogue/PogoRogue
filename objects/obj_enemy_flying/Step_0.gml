/// @description Fly back and forth

// Inherit the parent event
event_inherited();

if(is_dead) {
	spd = 0;	
} else if (place_meeting(x + speed, y, obj_ground_enemy_collision)) {
	spd *= -1;
	image_xscale = sign(spd);
}

x += spd;

if(!place_meeting(x + speed, y + sin(y_spd), obj_ground_enemy_collision)) {
	y += sin(y_spd);
}

y_spd += 0.05;
