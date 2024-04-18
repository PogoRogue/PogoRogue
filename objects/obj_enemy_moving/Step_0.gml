/// @description Move left and right

// Inherit the parent event
event_inherited();

sprite_index = spr_walk_enemy_walk;

if (at_edge or at_wall) {
	spd *= -1;
	sprite_index = spr_walk_enemy_idle;
}
if (spd >=0) { 
	image_xscale = 1;
}else{ 
	image_xscale = -1;
}

if(is_dead) {
	spd = 0;	
}

x += spd;