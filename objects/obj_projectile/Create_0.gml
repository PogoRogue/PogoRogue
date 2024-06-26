/// @description initialize variables
//for final boss
boss_projectile=false;


image_index = 0;
image_speed = 0;
angle = image_angle;
hspd = lengthdir_x(spd,angle);
vspd = lengthdir_y(spd,angle);
max_num_of_bounces = num_of_bounces;
init_damage = damage;
sound = audio_play_sound(snd_nothing,0,false);
colliding_with_enemy = false;

with instance_create_depth(x,y,depth-1,obj_projectile_flash_effect) {
	image_index = other.flash_frame;
	
	if (image_index < 4)  {
		alarm[0] = 2;
	}else {
		alarm[0] = 2;
	}
}

if destroy_time != 0 {
	alarm[0] = destroy_time;
}

//specific conditions

if (gun_name = "Bubble Gun") {
	randomize();
	spd += irandom_range(-4,0); //random speed for bubbles
	random_set_seed(global.seed);
	hspd = lengthdir_x(spd,angle);
	vspd = lengthdir_y(spd,angle);
	
}

if (gun_name = "Paintball Gun") {
	with obj_player {
		other.image_index = ((gun.bullets_per_bounce + max_ammo_buff) - gun.current_bullets);
	}
}


if (gun_name = "Laser Gun") {
	if audio_is_playing(snd_laser) {
		audio_stop_sound(snd_laser);
	}
	audio_play_sound(snd_laser,0,false);
	laser_x = obj_player.x - x;
	laser_y = obj_player.y - y;
	full_sprite = spr_projectile_laser_start;
	init_sprite = sprite_index;
	laser_boost = false; //only apply momentum if this is true
	mask_index = spr_nothing;
	image_speed = 1;
	rotation_speed = obj_player.rotation_speed;
	//obj_player.image_angle-90
	image_angle = obj_player.image_angle-90
	instance_laser = 0;
	
	//create rest of laser
	for (i = 2; i < 48; i++) {
		instance_laser = 0 = i;
		instance_create_depth(x+lengthdir_x(32*i,image_angle),y+lengthdir_y(32*i,image_angle),depth,obj_laser, {
			image_angle: image_angle-90,
			damage: damage,
			parent_obj: other,
			instance: i,
			destroy_on_impact: destroy_on_impact,
			full_sprite: spr_projectile_laser,
			mask_index: spr_nothing,
			rotation_speed: rotation_speed
		});
	}
}

//missile
if (gun_name = "Missile Launcher") {
	sound = audio_play_sound(snd_rocketwhoosh,0,false);
	temp_angle = image_angle;
	if collision_circle(x,y,160,obj_enemy_parent,false,true) != noone {
		if(!boss_projectile){
		    closest_enemy = instance_nearest(x,y,obj_enemy_parent);
		}else{
			closest_enemy = instance_nearest(x,y,obj_player);
		}
	}else {
		closest_enemy = noone;
	}
}

//star sucker
if (gun_name = "Star Sucker") {
	suck_distance = 224;
	init_angle = obj_player.angle;
	x = obj_player.x + lengthdir_x(suck_distance,image_angle);
	y = obj_player.y + lengthdir_y(suck_distance,image_angle);
	init_damage = damage;
	colliding_with_enemy = false;
	depth = obj_player.depth + 1;
	image_index = sprite_get_number(sprite_index)-1;
	num_of_bounces = 0;
}

sniped = false;
sniped_array = [];

//sniper rifle
if (gun_name = "Sniper Rifle") {
	laser_x = obj_player.x - x;
	laser_y = obj_player.y - y;
	full_sprite = spr_projectile_sniper_start_held;
	init_sprite = sprite_index;
	laser_boost = false; //only apply momentum if this is true
	mask_index = spr_nothing;
	image_speed = 1;
	image_index = sprite_get_number(sprite_index)-2;
	rotation_speed = obj_player.rotation_speed;
	sniped = false;
	sound = true;
	
	//create rest of laser
	for (i = 2; i < 48; i++) {
		instance_create_depth(x+lengthdir_x(32*i,image_angle),y+lengthdir_y(32*i,image_angle),depth,obj_sniper, {
			image_angle: image_angle,
			image_speed: image_speed,
			damage: damage,
			parent_obj: other,
			i: i,
			destroy_on_impact: destroy_on_impact,
			full_sprite: spr_projectile_sniper_middle_held,
			mask_index: spr_nothing,
			rotation_speed: rotation_speed
		});
	}
	//image_angle = obj_player.image_angle-90;
}

//slime blaster
if (gun_name = "Slime Blaster") {
	randomize();
	spd += irandom_range(-4,0);
	hspd = lengthdir_x(spd,angle);
	vspd = lengthdir_y(spd,angle);
	image_index = irandom_range(0,sprite_get_number(sprite_index)-1);
	random_set_seed(global.seed);
}

yoyo_array = [];
yoyo_array2 = []; //retract array

//yo-yo
if (gun_name = "Yo-yo") {
	audio_play_sound(snd_yoyo1,0,false);
	yoyo_num = 0;
	with obj_projectile {
		if (gun_name = "Yo-yo") {
			other.yoyo_num += 1;	
		}
	}
	if yoyo_num > 1 {
		if obj_player.frenzy = false and obj_player.aerial_assassin_frenzy = false {
			instance_destroy();
		}	
	}
	dist  = 0;
	max_dist = 160;
	ang = obj_player.angle;
	ang_increase_speed = 0
	ang_decrease_speed = 0;
	x = obj_player.x + lengthdir_x(dist,ang-90);
	y = obj_player.y + lengthdir_y(dist,ang-90);
	retracted = false;
	reached_end = false;
	depth = obj_player.depth-1;
	retract_spd = 0;
}

//javelins
if (gun_name = "Javelins") {
	temp_charge = 0;
	temp_charge_max = 9;
	
	if instance_exists(obj_ground) {
		if place_meeting(x,y,obj_ground) {
			depth = instance_nearest(x,y,obj_ground).depth + 1;	
		}else {
			depth = obj_player.depth + 1;	
		}
	}else {
		depth = obj_player.depth + 1;	
	}
	
	created = false;
	with instance_create_depth(x,y,depth,obj_javelin_charge) {
		javelin_object = other;
		instance_deactivate_object(javelin_object);	
	}
}

if gun_name = "Boomerangs" {
	sound = audio_play_sound(snd_boomerangs,0,false);
}

attach_to_player = 0;
if (gun_name = "Water Gun") {
	if !audio_is_playing(snd_watergun) {
		//audio_play_sound(snd_watergun,0,false);	
	}
	destroyable = false;
	x = obj_player.x + lengthdir_x(6,obj_player.angle-90);
	y = obj_player.y + lengthdir_y(6,obj_player.angle-90);
	image_index = 0;
	depth = obj_player.depth + 1;
	attach_to_player = 2;
	max_num_of_bounces = 0;
	num_of_bounces = 0;
	if obj_player.frenzy = true or obj_player.aerial_assassin_frenzy = true {
		global.water_frenzy -= 1;
		bullet_num = global.water_frenzy;
		
	}else {
		global.water_frenzy = -(obj_player.water_gun.bullets_per_bounce + obj_player.max_ammo_buff);
		//obj_player.water_gun.current_bullets -= 1;
		bullet_num = round(obj_player.water_gun.current_bullets);	
	}
	
	image_xscale = 1;
	
	water_index = global.water_index;	
	closest_water_object = noone;
	angle2 = 0;
	
	used_as_closest_object = false;
	first_object = false;
	with obj_projectile {
		if (gun_name = "Water Gun" and water_index = other.water_index) {
			if bullet_num = other.bullet_num + 1 {
				other.closest_water_object = id;
				angle2 = point_direction(other.x,other.x,x,y);
				other.angle2 = point_direction(x,y,other.x,other.y);
				//other.image_angle = angle2;
				used_as_closest_object = true;
				other.first_object = true;
			}
		}
	}
	
	with scr_Instance_Nearest_Notme(x,y,obj_water_outline) {
		if (water_index = other.water_index) {
			//other.closest_water_object = id;
		}
	}
	
	if instance_exists(closest_water_object) {
		angle2 = point_direction(x,y,closest_water_object.x,closest_water_object.y)+90;
	}
	
	if place_meeting(x,y,obj_ground) {
		if global.drilltipbullets = false {
			draw_fill = true;
			depth += 100;
		}else {
			draw_fill = true;	
		}
	}else {
		draw_fill = false;	
	}

	
	//outline
	with instance_create_depth(x,y,depth+10,obj_water_outline) {
		image_angle = other.image_angle;
		parent_obj = other;
		water_index = global.water_index;
		closest_water_object = noone;
		with scr_Instance_Nearest_Notme(x,y,obj_water_outline) {
			if (water_index = other.water_index) {
				other.closest_water_object = id;
			}
		}
	}
}

//destroy projectile after 30 seconds if still exists
alarm[2] = 1800;

scr_Projectile_Bounce("Javelins");