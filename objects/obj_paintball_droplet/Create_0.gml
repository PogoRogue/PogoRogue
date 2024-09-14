image_index = 0;//irandom_range(0,sprite_get_number(sprite_index)-1);
image_alpha = 1.25;
color_index = 0;

distance_to_ground = 0;

if place_meeting(x,y,obj_ground) {
	y -= 4; 
	free = false;
}else {
	free = true;
}
/*
if global.drilltipbullets = false {
	while (!place_meeting(x,y+distance_to_ground,obj_ground) and !place_meeting(x,y+distance_to_ground,obj_ground_oneway) and !place_meeting(x,y+distance_to_ground,obj_enemy_parent)) {
		distance_to_ground += 1;
	}
}*/

alarm[0] = 1;
alarm[1] = 10;

damage = 0;
deal_damage = false;

if obj_player.paintball_gun.level > 1 {
	image_speed = 0.75;
}

if obj_player.paintball_gun.level > 3 {
	damage = 2;	
	deal_damage = true;
}