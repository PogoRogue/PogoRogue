/// @description Walk back an forth while firing

// Inherit the parent event
event_inherited();


//sprite_index = spr_enemy_moving_walk;

if (at_edge or at_wall) {
	spd *= -1;
	//sprite_index = spr_enemy_moving;
}
if (spd>=0) { 
	image_xscale = 1;
}else{ 
	image_xscale = -1;
}

if(is_dead) {
	spd = 0;	
}

if(sprite_index != spr_enemy_shooter_cannon) {
	x += spd;	
}

