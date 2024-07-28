/// @description create plasma trail
alarm[5] = trail_spawnrate;
randomize();
var spd_multiplier = random_range(0.8,1.2);
if trail_spawnrate = 1 {
	var new_hspd = (-hspd/2) * spd_multiplier;
	var new_vspd = (-vspd/2) * spd_multiplier;
}else {
	var new_hspd = (-hspd/8) * spd_multiplier;
	var new_vspd = (-vspd/8) * spd_multiplier;
}
var new_type = choose(2,2,2,2,1);
var random_distance = irandom_range(-((sprite_get_width(sprite_index)/2)-sprite_get_width(trail_sprite)/2) - 2,((sprite_get_width(sprite_index)/2)-sprite_get_width(trail_sprite)/2) + 2);
instance_create_depth(x+lengthdir_x(random_distance,point_direction(x, y, x+hspd, y+vspd)-90),y+lengthdir_y(random_distance,point_direction(x, y, x+hspd, y+vspd)-90),depth,obj_plasma_trail,{sprite_index: trail_sprite, hspd: new_hspd, vspd: new_vspd, type: new_type});
randomize();
var spd_multiplier2 = random_range(0.8,1.2);
var new_hspd2 = (-hspd/2) * spd_multiplier2;
var new_vspd2 = (-vspd/2) * spd_multiplier2;
var new_type2 = choose(2,2,2,2,1);
var random_distance2 = irandom_range(-((sprite_get_width(sprite_index)/2)-sprite_get_width(trail_sprite)/2) - 2,((sprite_get_width(sprite_index)/2)-sprite_get_width(trail_sprite)/2) + 2);
instance_create_depth(x+lengthdir_x(random_distance2,point_direction(x, y, x+hspd, y+vspd)-90),y+lengthdir_y(random_distance2,point_direction(x, y, x+hspd, y+vspd)-90),depth,obj_plasma_trail,{sprite_index: trail_sprite, hspd: new_hspd2, vspd: new_vspd2, type: new_type2});
if trail_spawnrate = 1 {
	randomize();
	var spd_multiplier3 = random_range(0.8,1.2);
	var new_hspd3 = (-hspd/2) * spd_multiplier2;
	var new_vspd3 = (-vspd/2) * spd_multiplier2;
	var new_type3 = choose(2,1,1,1,1);
	var destroy1 = choose(true,true,false);
	var random_distance3 = -((sprite_get_width(sprite_index)/2)-sprite_get_width(trail_sprite)/2) - 2;
	if destroy1 = false {
		instance_create_depth(x+lengthdir_x(random_distance3,point_direction(x, y, x+hspd, y+vspd)-90),y+lengthdir_y(random_distance3,point_direction(x, y, x+hspd, y+vspd)-90),depth,obj_plasma_trail,{sprite_index: trail_sprite, hspd: new_hspd3, vspd: new_vspd3, type: new_type3});
	}
	randomize();
	var spd_multiplier4 = random_range(0.8,1.2);
	var new_hspd4 = (-hspd/2) * spd_multiplier4;
	var new_vspd4 = (-vspd/2) * spd_multiplier4;
	var new_type4 = choose(2,1,1,1,1);
	var destroy2 = choose(true,true,false);
	var random_distance4 = ((sprite_get_width(sprite_index)/2)-sprite_get_width(trail_sprite)/2) + 2;
	if destroy2 = false {
		instance_create_depth(x+lengthdir_x(random_distance4,point_direction(x, y, x+hspd, y+vspd)-90),y+lengthdir_y(random_distance4,point_direction(x, y, x+hspd, y+vspd)-90),depth,obj_plasma_trail,{sprite_index: trail_sprite, hspd: new_hspd4, vspd: new_vspd4, type: new_type4});
	}
	randomize();
	var spd_multiplier5 = random_range(0.8,1);
	var new_hspd5 = (-hspd/2) * spd_multiplier4;
	var new_vspd5 = (-vspd/2) * spd_multiplier4;
	var new_type5 = choose(1,1,1,1,1);
	var destroy3 = choose(true,true,false);
	var random_distance5 = irandom_range(-2,2);
	if destroy3 = false {
		instance_create_depth(x+lengthdir_x(random_distance5,point_direction(x, y, x+hspd, y+vspd)-90),y+lengthdir_y(random_distance5,point_direction(x, y, x+hspd, y+vspd)-90),depth,obj_plasma_trail,{sprite_index: trail_sprite, hspd: new_hspd5, vspd: new_vspd5, type: new_type5});
	}
}
randomize();
random_set_seed(global.seed);