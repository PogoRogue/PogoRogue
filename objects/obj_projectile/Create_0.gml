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

if (gun_name = "泡泡枪") {
	randomize();
	spd += irandom_range(-4,0); //random speed for bubbles
	random_set_seed(global.seed);
	hspd = lengthdir_x(spd,angle);
	vspd = lengthdir_y(spd,angle);
	
}

if (gun_name = "彩弹枪") {
	with obj_player {
		other.image_index = ((gun.bullets_per_bounce + max_ammo_buff) - gun.current_bullets);
	}
}


if (gun_name = "量子冲天炮") {
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
	image_speed = 1 + (obj_player.laser_gun.level > 1);
	rotation_speed = obj_player.rotation_speed;
	//obj_player.image_angle-90
	image_angle = obj_player.image_angle-90
	instance_laser = 0;
	hspd = 0;
	vspd = 0;
	
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
			rotation_speed: rotation_speed,
			spread_index: spread_index
		});
	}
}

//missile
if (gun_name = "导弹发射器") {
	if spread_index = 0 {
		sound = audio_play_sound(snd_rocketwhoosh,0,false);
	}
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
if (gun_name = "吸星者") {
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
if (gun_name = "狙击枪") {
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
	hspd = 0;
	vspd = 0;
	
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
			rotation_speed: rotation_speed,
			spread_index: spread_index
		});
	}
	//image_angle = obj_player.image_angle-90;
}

//slime blaster
if (gun_name = "史莱姆发射器") {
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
if (gun_name = "悠悠球") {
	yoyo_spd = 8 + (4 * global.strong_muscles) + (2 * (gun_level > 1)) + (4 * (gun_level > 2));
	if !audio_is_playing(snd_yoyo1) {
		audio_play_sound(snd_yoyo1,0,false);
	}
	yoyo_num = 0;
	with obj_projectile {
		if (gun_name = "悠悠球") {
			other.yoyo_num += 1;	
		}
	}
	if yoyo_num > obj_player.yoyo_gun.spread_number {
		if obj_player.frenzy = false and obj_player.aerial_assassin_frenzy = false and obj_player.pogomode = false {
			instance_destroy();
		}	
	}
	dist  = 0;
	max_dist = yoyo_spd * 20; //160
	if obj_player.yoyo_gun.spread_number = 1 {
		ang = obj_player.angle;
		angle_offset = 0;
	}else if obj_player.yoyo_gun.spread_number = 3 { //triple shot
		if spread_index = 0 {
			angle_offset = -obj_player.yoyo_gun.spread_angle;
		}else if spread_index = 1 {
			angle_offset = 0;
		}else if spread_index = 2 {
			angle_offset = obj_player.yoyo_gun.spread_angle;
		}
		ang = obj_player.angle+angle_offset;
		
	}
	offset_set = false;
	ang_increase_speed = 0
	ang_decrease_speed = 0;
	x = obj_player.x + lengthdir_x(dist,ang-90);
	y = obj_player.y + lengthdir_y(dist,ang-90);
	retracted = false;
	reached_end = false;
	depth = obj_player.depth-1;
	retract_spd = 0;
}

//elinelins
if (gun_name = "标枪") {
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

if gun_name = "回旋镖" and spread_index = 0 {
	sound = audio_play_sound(snd_boomerangs,0,false);
}

attach_to_player = 0;
if (gun_name = "小黄鸭水枪") {
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
	if obj_player.frenzy = true or obj_player.aerial_assassin_frenzy = true or obj_player.pogomode = true {
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
		if (gun_name = "小黄鸭水枪" and water_index = other.water_index) {
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

//Grappling Helmet
if (gun_name = "钩爪帽") or gun_name = "钩爪锐枪" {
	rope_sound = audio_play_sound(snd_grappling_rope,0,false);
	init_angle = obj_player.angle;
	distance_traveled = 0;
	if (gun_name = "钩爪帽") {
		damage = 0;
	}
	init_damage = damage;
	colliding_with_enemy = false;
	depth = obj_player.depth + 1;
	image_index = 0;
	num_of_bounces = 0;
	sprite_angle = obj_player.angle+90;
	init_angle = image_angle;
	init_x = x;
	init_y = y;
	image_yscale = obj_player.image_xscale;
	collided = false;
	retract = false;
	retract_spd = 0;
	collision_x = x;
	collision_y = y;
	retracted = false;
	retracting_distance = 0;
	retracting_distance_set = false;
	lerp_value = 0;
	retract_angle = obj_player.angle+90;
	angle_diff = 0;
	
	enemies_array = [];
}

if (gun_name = "The Portal") {
	image_angle += 90;
	spr_angle = image_angle;	
	image_angle = 0;
}

if (gun_name = "拳头枪") {
	maxspd_frames = 5;
	decrease_spd = 0.9;
	still_time = 60;
	randomize();
	puncher1_snd = choose(snd_puncher1,snd_puncher2);
	random_set_seed(global.seed);
	if puncher1_snd = snd_puncher1 {
		puncher2_snd = 	snd_puncher2;
	}else {
		puncher2_snd = 	snd_puncher1;
	}
	image_yscale = sign((2 * (obj_player.puncher_gun.current_bullets % 2)) - 1);
	if image_yscale = 1 and spread_index = 0 {
		audio_play_sound(puncher1_snd,0,false);
	}else if spread_index = 0 {
		audio_play_sound(puncher2_snd,0,false);
	}
	init_damage = damage;
	colliding_with_enemy = false;
	x_prev_array = [0,0,0,0,0];
	y_prev_array = [0,0,0,0,0];
	trail = true;
	enemies_array = [];
	
	destroy_on_impact = false;
	destroyable = false;
}

if (gun_name = "维和者") or (gun_name = "维和者") or (gun_name = "维和者") 
or (gun_name = "维和者") or (gun_name = "维和者") or (gun_name = "维和者") {
	randomize();
	if obj_player.sixshooter_gun.inaccuracy = 5 {
		random_snd = choose(snd_sixshooter1,snd_sixshooter2,snd_sixshooter3,snd_sixshooter4,snd_sixshooter5,snd_sixshooter6);
	}else {
		random_snd = snd_sixshooter1;
	}
	random_set_seed(global.seed);
	if /*!audio_is_playing(random_snd) and*/ spread_index = 0 or obj_player.sixshooter_gun.inaccuracy != 5 and spread_index = 0 {
		audio_play_sound(random_snd,0,false);
	}
	depth = obj_player.depth+5;
	if obj_player.sixshooter_gun.spread_number > 1 {
		x = obj_player.x + lengthdir_x(32,image_angle);
		y = obj_player.y + lengthdir_y(32,image_angle);
	}
	show_debug_message(image_angle);
	
	mask_index = sprite_index;
}

//destroy projectile after 30 seconds if still exists
if (gun_name != "气球枪") {
	alarm[2] = 1800;
}

//Plasma Gun
if (gun_name = "等离子炮") {
	//depth = obj_player.depth+1;
	temp_charge = 0;
	temp_charge_max = 9;
	orb_glow_sprite = spr_plasma_outline1;
	glow_alpha = -1;
	glow_up = true;
	created = false;
	with instance_create_depth(x,y,obj_player.depth+1,obj_plasma_charge) {
		plasma_object = other;
		spread_index = other.spread_index;
		//instance_deactivate_object(plasma_object);	
	}
	trail_sprite = spr_plasma_trail1;
	trail_spawnrate = 5;
	alarm[2] = 600;
	
	init_damage = damage;
	colliding_with_enemy = false;
	enemies_array = [];
	
	if obj_player.plasma_gun.spread_number = 1 {
		angle_offset = 0;
	}else if obj_player.plasma_gun.spread_number = 3 { //triple shot
		if spread_index = 0 {
			angle_offset = -obj_player.plasma_gun.spread_angle;
		}else if spread_index = 1 {
			angle_offset = 0;
		}else if spread_index = 2 {
			angle_offset = obj_player.plasma_gun.spread_angle;
		}
	}
	create_trail = false;
	create_trail_num = 0;
}

if gun_name = "弹球枪" {
	//mask_index = spr_projectile_bouncyball_mask;
}

//Snow Cannon
if (gun_name = "雪球加农炮") {
	//damage = 0;
	init_damage = damage;
	colliding_with_enemy = false;
	enemies_array = [];
}

//Balloon Gun
if (gun_name = "气球枪") {
	randomize();
	sprite_index = choose(spr_projectile_balloon,spr_projectile_balloon_orange,spr_projectile_balloon_yellow,
	spr_projectile_balloon_green,spr_projectile_balloon_blue,spr_projectile_balloon_pink);
	random_set_seed(global.seed);
	mask_index = spr_projectile_balloon_mask;
	damage = 0;
	max_image_index = 5 + ((obj_player.balloon_gun.level = 2) * 2) + ((obj_player.balloon_gun.level >= 3) * 3);
	//depth = obj_player.depth+1;
	temp_charge = 0;
	temp_charge_max = 9;
	glow_alpha = -1;
	glow_up = true;
	created = false;
	ground_free = false;
	with instance_create_depth(x,y,obj_player.depth+1,obj_balloon_charge) {
		balloon_object = other;
		spread_index = other.spread_index;
		//instance_deactivate_object(balloon_object);	
	}
	//alarm[2] = 600;
	
	init_damage = damage;
	colliding_with_enemy = false;
	enemies_array = [];
	
	if obj_player.balloon_gun.spread_number = 1 {
		angle_offset = 0;
	}else if obj_player.balloon_gun.spread_number = 2 { //doubl shot
		if spread_index = 0 {
			angle_offset = -obj_player.balloon_gun.spread_angle/2;
		}else if spread_index = 1 {
			angle_offset = obj_player.balloon_gun.spread_angle/2;
		}
	}else if obj_player.balloon_gun.spread_number = 3 { //triple shot
		if spread_index = 0 {
			angle_offset = -obj_player.balloon_gun.spread_angle;
		}else if spread_index = 1 {
			angle_offset = 0;
		}else if spread_index = 2 {
			angle_offset = obj_player.balloon_gun.spread_angle;
		}
	}
}

if (gun_name = "磁力飞轮") {
	summoned = false;
	stuck = false;
	summon_speed = 0;
	
	if (obj_player.frisbee_gun.current_bullets % 2) = 0 {
		image_index = 0;
	}else {
		image_index = 1;
	}
	
	init_damage = damage;
	colliding_with_enemy = false;
	enemies_array = [];
	
	x_prev_array = [0,0,0,0,0];
	y_prev_array = [0,0,0,0,0];
	trail = true;
}

//missile
if (gun_name = "追踪飞镖") {
	if spread_index = 0 {
		//sound = audio_play_sound(snd_rocketwhoosh,0,false);
	}
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
	dart_created = false;
}

free = true //dont bounce if colliding w/ ground on spawn

if gun_name != "等离子炮" {
	scr_Projectile_Bounce("标枪");
	scr_Projectile_Bounce("维和者");
	scr_Projectile_Bounce("维和者");
	scr_Projectile_Bounce("维和者");
	scr_Projectile_Bounce("维和者");
	scr_Projectile_Bounce("维和者");
	scr_Projectile_Bounce("维和者");
	scr_Projectile_Bounce("拳头枪");
}else {
	destroyable = true;	
}

init_depth = depth;