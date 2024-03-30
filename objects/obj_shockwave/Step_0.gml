/// @description Stop at walls
// You can write your code in this editor
at_edge = !collision_point(x + (sign(hspeed) * 16), y + (sprite_height / 2), obj_ground_parent, false, false) && place_meeting(x, y + 1, obj_ground_parent); 
at_wall = place_meeting(x + hspeed, y, obj_ground_parent);
if(at_edge or at_wall){
	instance_destroy();
}

