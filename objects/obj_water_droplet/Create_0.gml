//image_speed = 0;
image_index = 0;//irandom_range(0,sprite_get_number(sprite_index)-1);
image_alpha = 1.25;

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

randomize();
is_white = choose("normal","normal","normal","normal","normal","white","white","white","normal","blue");
if is_white = "blue" {
	sprite_index = spr_projectile_water_droplet_blue;	
	depth += 2;
}
if is_white = "white" {
	sprite_index = spr_projectile_water_droplet_white;
	depth += 1;
}
random_set_seed(global.seed);