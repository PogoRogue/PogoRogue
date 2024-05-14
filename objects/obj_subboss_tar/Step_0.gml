/// @description Fall to ground
// You can write your code in this editor

// Fall or expand
if(!place_meeting(x, y + 1, obj_ground_parent) || !collision_point(x, y + 20, obj_ground_parent, true, true)) {
	vspeed = vspeed + obj_player.grv;
	image_index = 0;
} else {
	vspeed = 0;
	while(collision_point(x, y + 16, obj_ground_parent, true, true)) {
		y--;
	}	
}

if(place_meeting(x, y, obj_player)) {
	obj_player.vsp_basicjump = diminished_player_jump;
	is_touching_player = true;
	wobble = 0.4;
} else if(is_touching_player){
	obj_player.vsp_basicjump = initial_player_jump;
	is_touching_player = false;
}

// Cause wobble effect
wobble *= 0.95;
stretch += wobble;
image_xscale = 1.0 + (0.05 * sin(stretch));

if(is_despawning) {
	image_alpha *= 0.9;
}

if(image_index == 6) {
	image_speed = 0;
	image_index = 6;
}

if place_meeting(x,y,obj_player) {
	depth = obj_player.depth - 10;
}else {
	depth = -6;	
}