/// @description Stop at walls
// You can write your code in this editor

at_wall = place_meeting(x + hspeed, y, obj_ground_parent);

if(at_wall){
	instance_destroy();
}

