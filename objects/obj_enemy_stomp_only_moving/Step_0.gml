/// @description Walk back and forth

// Inherit the parent event
event_inherited();

at_edge = !collision_point(x + (sign(spd)), y + (sprite_height / 2), obj_ground_parent, false, false); 
at_wall = place_meeting(x + spd, y, obj_ground_parent);

if (at_edge or at_wall) {
	spd *= -1;
}
if (spd == 0.5) { image_xscale = -1;}
if (spd == -0.5) { image_xscale = 1;}

if(is_dead) {
	spd = 0;
	sprite_index = spr_enemy_stomp_only;
}

if(sprite_index != spr_enemy_stomp_only_Shield) {
	hspeed= spd;
}
