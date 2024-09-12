/// @description Walk back an forth while firing

// Inherit the parent event
event_inherited();

at_edge = !collision_point(x + (sign(spd)), y + (sprite_height / 2), obj_ground_parent, false, false); 
at_wall = place_meeting(x + spd, y, obj_ground_parent) and !place_meeting(x,y,obj_launchpad);

//sprite_index = spr_enemy_moving_walk;

if (at_edge or at_wall) {
	spd *= -1;
	//sprite_index = spr_enemy_moving;
}
if (spd == 0.5) { image_xscale = 1;}
if (spd == -0.5) { image_xscale = -1;}

if(is_dead) {
	spd = 0;	
}

if(sprite_index != spr_enemy_shooter_cannon) {
	x += spd;	
}

