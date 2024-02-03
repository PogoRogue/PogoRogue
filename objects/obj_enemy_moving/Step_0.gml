/// @description Move left and right

// Inherit the parent event
event_inherited();

// Move left and right
at_edge = !collision_point(x + (sign(spd)), y + (sprite_height / 2), obj_ground_parent, false, false); 
at_wall = place_meeting(x + spd, y, obj_ground_parent);

sprite_index = spr_WalkEnemy_Walk;

if (at_edge or at_wall) {
	spd *= -1;
	sprite_index = spr_WalkEnemy_Idle;
}
if (spd == 0.5) { image_xscale = 1;}
if (spd == -0.5) { image_xscale = -1;}

if(is_dead) {
	spd = 0;	
}

x += spd;