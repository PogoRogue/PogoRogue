/// @description Walk back and forth

// Inherit the parent event
event_inherited();

if (at_edge or at_wall) {
	spd *= -1;
}
if (spd >= 0) { 
	image_xscale = -1;
}else{ 
	image_xscale = 1;
}

if(is_dead) {
	spd = 0;
	sprite_index = spr_enemy_stomp_only;
}

if(sprite_index != spr_enemy_stomp_only_Shield) {
	x += spd;
}
