/// @description Stretch to melee end

// Inherit the parent event
event_inherited();

if(instance_exists(melee_end)) {
	image_angle = point_direction(x, y, melee_end.x, melee_end.y);
	image_xscale = point_distance(x, y, melee_end.x, melee_end.y) / 96;
	
	if(is_dead) {
		melee_end.is_dead = true;
	}
}
