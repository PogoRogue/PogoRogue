/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Move left and right
at_edge = !collision_point(x + (sign(spd) * 16), y + (sprite_height / 2), obj_ground_enemy_collision, false, false) && place_meeting(x, y + 1, obj_ground_parent); 
at_wall = place_meeting(x + spd, y, obj_ground_enemy_collision);