/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(!detected && distance_to_object(player) < vision_range) {
	detected = true;
	alarm_set(1, vanish_timer);
}

if(is_dead) {
	spd = 0;
}

if(detected) {
	direction = point_direction(player.x, player.y, x, y);
	speed = spd;
	vspeed += 0.75 * sign(spd);
	image_xscale = hspeed > 0 ? 1 : -1;
	
	if(!place_meeting(x + hspeed, y, obj_ground_parent)) {
		x += hspeed;
	}
	
	if(!place_meeting(x, y + vspeed, obj_ground_parent)) {
		y += vspeed;
	}
	
	speed = 0;
}
