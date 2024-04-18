/// @description Move left and right

// Inherit the parent event
event_inherited();



if (!is_dead) {
	sprite_index = spr_enemy_walking_explosion_walk;
}

if (at_edge or at_wall) {
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

x += spd;

// Move to top of surface if stuck in floor
while(place_meeting(x, y, obj_ground_parent)) {
	y--;
}	
