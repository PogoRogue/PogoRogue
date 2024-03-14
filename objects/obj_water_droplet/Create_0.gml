//image_speed = 0;
image_index = 0;//irandom_range(0,sprite_get_number(sprite_index)-1);

distance_to_ground = 0;

if place_meeting(x,y,obj_ground) {
	y -= 4;	
}

if global.drilltipbullets = false {
	while (!place_meeting(x,y+distance_to_ground,obj_ground) and !place_meeting(x,y+distance_to_ground,obj_ground_oneway) and !place_meeting(x,y+distance_to_ground,obj_enemy_parent)) {
		distance_to_ground += 1;
	}
}

alarm[0] = 1;