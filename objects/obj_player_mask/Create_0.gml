/// @description initialize variables
parent_index = instance_nearest(x,y,obj_player);
other2 = noone;

colliding_with_ground = false;
colliding_with_ground_left = false;
colliding_with_ground_right = false;
colliding_with_enemies = false;
_hit_button = false;

sprite_index = spr_player_mask_zekai;
	
//local variables were being weird so I just defined them here
_break = false; //left
_break2 = false; //right
_break3 = false; //bottom

left_corner = false;
right_corner = false;
bottom_left_corner = false;
bottom_right_corner = false;
top = false;
left = false;
right = false;

active = false; //delayed so player doesnt spawn out of bounds
alarm[3] = 30;