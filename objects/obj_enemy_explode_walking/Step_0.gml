/// @description Move left and right

// Inherit the parent event
event_inherited();

// Move left and right
at_edge = !collision_point(x + (sign(spd) * 16), y + (sprite_height / 2), obj_ground_parent, false, false) && place_meeting(x, y + 1, obj_ground_parent); 
at_wall = place_meeting(x + spd, y, obj_ground) and !place_meeting(x,y,obj_launchpad);

if (!is_dead) {
	sprite_index = spr_enemy_walking_explosion_walk;
}

if (at_edge or at_wall) and place_meeting(x,y+1,obj_ground) 
or (at_edge or at_wall) and place_meeting(x,y+1,obj_ground_oneway) and !place_meeting(x,y-1,obj_ground_oneway) {
	spd *= -1;
}
if (spd == 0.5) { image_xscale = 1;}
if (spd == -0.5) { image_xscale = -1;}

if(is_dead) {
	spd = 0;
	if (sprite_index == spr_enemy_walking_explosion_walk) {
		image_index = 0;
		sprite_index = spr_enemy_walking_explosion;
	}
}

if sprite_index = spr_enemy_walking_explosion {
	if scr_Animation_Complete() {
		instance_destroy();	
	}
}

image_alpha = 1.0;

if(!place_meeting(x + spd, y, obj_ground_parent)) {
	x += spd;
}

// Move to top of surface if stuck in floor
while(place_meeting(x, y, obj_ground)) {
	y--;
}	
