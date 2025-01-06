
x += hspd;
y += vspd;

if place_meeting(x,y,obj_ground) and gun_name != "标枪" and gun_name != "等离子炮" and gun_name != "雪球加农炮" and gun_name != "量子冲天炮" and destroy_on_impact {
	if global.drilltipbullets = false and num_of_bounces > 0 {
		depth = instance_place(x,y,obj_ground).depth + 20;
	}else if num_of_bounces > 0 {
		depth = init_depth;
	}
}else {
	depth = init_depth;
}


//cant damage enemies if out of view
if instance_exists(obj_camera) {
	var camera_width = camera_get_view_width(view_camera[0])/2;
	var camera_height = camera_get_view_height(view_camera[0])/2;
	var padding = 128;

	if !(point_in_rectangle(x,y,obj_camera.x-camera_width-padding,obj_camera.y-camera_height-padding,obj_camera.x+camera_width+padding,obj_camera.y+camera_height+padding)) {
		damage = 0;
	}else {
		damage = init_damage;
		//damage buff for bouncy ball gun 
		if (gun_name = "弹球枪") and num_of_bounces < max_num_of_bounces {
			damage = init_damage * (2*(max_num_of_bounces-num_of_bounces));
			image_index = max_num_of_bounces-num_of_bounces;
		}else if (gun_name = "标枪") or gun_name = "等离子炮" or gun_name = "气球枪"  {
			if created = true {
				damage = init_damage + ((temp_charge/temp_charge_max)*16);	
			}
		}
	}
	
	//destroy if far enough away from camera
	if  !(point_in_rectangle(x,y,obj_camera.x-camera_width-(padding*10),obj_camera.y-camera_height-(padding*10),obj_camera.x+camera_width+(padding*10),obj_camera.y+camera_height+(padding*10))) {
		instance_destroy();
	}
}

//destroy when touching ground
if (destroy_on_impact and (num_of_bounces <= 0) and destroyable = true) {
	if (place_meeting(x,y,obj_ground)) and global.drilltipbullets = false
	or (place_meeting(x,y,obj_boss_sequence)) and global.drilltipbullets = false and instance_place(x,y,obj_boss_sequence).image_index != 5 {
		if gun_name = "彩弹枪" {
			alarm[0] = 1;
			//splatter code here
		}else if gun_name = "小黄鸭水枪" {
			alarm[0] = 1;
			//sprite_index = spr_projectile_water_droplet;
			
		}else if gun_name = "拳头枪" {
			//alarm[0] = 20;
			spd = 0;
			hspd = 0;
			vspd = 0;
			still_time = 0;
		}else {
			alarm[0] = 1;	
		}
	}
}

//gravity
if (grav_affected) {
	vspd += grv;	
}

//rotate
if (gun_name = "手雷发射器") {
	image_angle -= hspd*2;
}

//left
if ((place_meeting(x+hspd,y,obj_ground)) and hspd > 0 and num_of_bounces > 0 ) and free = true and !(place_meeting(x,y+vspd,obj_ground)){
	while !place_meeting(x+sign(hspd),y,obj_ground) {
		x += sign(hspd);
	}
	hspd *= -bounce_amount;
	num_of_bounces -= 1;
	if (gun_name = "手雷发射器") {
		audio_play_sound(snd_grenade_bounce, 0, false);
		image_index = 1;
		alarm[1] = 3;
	}else if (gun_name != "The Portal") {
		image_angle = point_direction(x,y,x+hspd,y+vspd);
	}
	
	if gun_name = "弹球枪" {
		randomize();
		audio_play_sound(choose(snd_bbb_bounce,snd_bbb_bounce2,snd_bbb_bounce3),0,false);
		random_set_seed(global.seed);
	}
	
	y += vspd;

}else if ((place_meeting(x+hspd,y,obj_ground)) and hspd < 0 and num_of_bounces > 0 ) and free = true and !(place_meeting(x,y+vspd,obj_ground)) {  //right
	while !place_meeting(x+sign(hspd),y,obj_ground) {
		x += sign(hspd);
	}
	hspd *= -bounce_amount;
	num_of_bounces -= 1;
	if (gun_name = "手雷发射器") {
		audio_play_sound(snd_grenade_bounce, 0, false);
		image_index = 1;
		alarm[1] = 5;
	}else if (gun_name != "The Portal") {
		image_angle = point_direction(x,y,x+hspd,y+vspd);	
	}
	
	if gun_name = "弹球枪" {
		randomize();
		audio_play_sound(choose(snd_bbb_bounce,snd_bbb_bounce2,snd_bbb_bounce3),0,false);
		random_set_seed(global.seed);
	}
	
	y += vspd;
	
}else if ((place_meeting(x,y+vspd,obj_ground) and vspd < 0) and num_of_bounces > 0 ) and free = true and ((gun_name = "等离子炮" and !place_meeting(x,y,obj_ground)) or gun_name != "等离子炮") {
	while !place_meeting(x,y+sign(vspd),obj_ground) {
		y += sign(vspd);
	}
	vspd *= -bounce_amount;
	num_of_bounces -= 1;
	if (gun_name = "手雷发射器") {
		audio_play_sound(snd_grenade_bounce, 0, false);
		image_index = 1;
		alarm[1] = 5;
	}else if (gun_name != "The Portal") {
		image_angle = point_direction(x,y,x+hspd,y+vspd);
	}
	
	if gun_name = "弹球枪" {
		randomize();
		audio_play_sound(choose(snd_bbb_bounce,snd_bbb_bounce2,snd_bbb_bounce3),0,false);
		random_set_seed(global.seed);	
	}
	
	x += hspd;
	
}else if (place_meeting(x,y+vspd+1,obj_ground) and vspd > 0 and num_of_bounces > 0 ) and free = true and ((gun_name = "等离子炮" and !place_meeting(x,y,obj_ground)) or gun_name != "等离子炮")
or (place_meeting(x,y+vspd+1,obj_ground_oneway) /*and !place_meeting(x,y-1,obj_ground_oneway)*/ and vspd > 0 and num_of_bounces > 0) /*and gun_name != "拳头枪"*/ and free = true  and ((gun_name = "等离子炮" and !place_meeting(x,y,obj_ground_oneway)) or gun_name != "等离子炮") { //top
	while !place_meeting(x,y+sign(vspd)+1,obj_ground) and (!place_meeting(x,y+sign(vspd),obj_ground_oneway) /*and gun_name != "拳头枪"*/) {
		y += sign(vspd);
	}
	vspd *= -bounce_amount;
	num_of_bounces -= 1;
	if (gun_name = "手雷发射器") {
		audio_play_sound(snd_grenade_bounce, 0, false);
		image_index = 1;
		alarm[1] = 5;
	}else if (gun_name != "The Portal") {
		image_angle = point_direction(x,y,x+hspd,y+vspd);
	}
	
	if gun_name = "弹球枪" {
		randomize();
		audio_play_sound(choose(snd_bbb_bounce,snd_bbb_bounce2,snd_bbb_bounce3),0,false);
		random_set_seed(global.seed);
	}
	
	x += hspd;

}else if ((place_meeting(x,y+vspd,obj_ground_oneway) and !place_meeting(x,y-1,obj_ground_oneway) and vspd > 0) and num_of_bounces <= 0 and max_num_of_bounces > 0 and global.drilltipbullets = false and gun_name != "雪球加农炮" /*and gun_name != "拳头枪"*/) 
or (place_meeting(x,y,obj_player_mask) and gun_name = "手雷发射器" and global.drilltipbullets = false) 
or (place_meeting(x,y,obj_player) and gun_name = "手雷发射器" and global.drilltipbullets = false) {
	alarm[0] = 1;
}




//missile
if (gun_name = "导弹发射器") {
	//speed up
	if speed < 8 + (8 * (gun_level > 1)) {
		speed += 0.25 + (0.25 * (gun_level > 1));	
	}
	
	//lock on to enemy
	if collision_circle(x,y,160+(160 * (gun_level > 1)),obj_enemy_parent,false,true) != noone {
		closest_enemy = instance_nearest(x,y,obj_enemy_parent);
	}else {
		closest_enemy = noone;
	}
	
	//rotate
	if closest_enemy != noone {
		//num_of_bounces = 0;
		damage = init_damage;
		scr_Gradually_Turn(self.id,closest_enemy,45,1);
		direction = image_angle;
		if place_meeting(x,y,closest_enemy) {
			instance_destroy();	
		}
	}else {
		direction = image_angle;
		
		if place_meeting(x,y+vspeed,obj_ground) and num_of_bounces > 0  {
			while !place_meeting(x,y+sign(vspeed),obj_ground) {
				y += sign(vspeed);
			}
			image_angle = point_direction(x,y,x+hspeed,y-vspeed);
			direction = image_angle;
			num_of_bounces -= 1;
		}
		if place_meeting(x,y+vspeed,obj_ground_oneway) and !place_meeting(x,y,obj_ground_oneway) and vspeed > 0 and num_of_bounces <= 0 and global.drilltipbullets = false {
			instance_destroy();	
		}else if place_meeting(x,y+vspeed,obj_ground_oneway) and !place_meeting(x,y,obj_ground_oneway) and vspeed > 0 and num_of_bounces > 0   {
			image_angle = point_direction(x,y,x+hspeed,y-vspeed);
			direction = image_angle;
			num_of_bounces -= 1;
		}
		if place_meeting(x+hspeed,y,obj_ground) and num_of_bounces > 0  {
			while !place_meeting(x+sign(hspeed),y,obj_ground) {
				x += sign(hspeed);
			}
			image_angle = point_direction(x,y,x-hspeed,y+vspeed);
			direction = image_angle;
			num_of_bounces -= 1;
		}
	}
}

if (gun_name = "回旋镖") {
	hspd = 0;
	vspd = 0;
	image_angle += 20;
	if spd > 0 {
		spd -= (0.25 + (0.25 * (gun_level > 1)) + (0.2 * (gun_level > 2)) + (0.2 * (gun_level > 3)));
		speed = spd;
		direction = angle;
		if spd <= 0 {
			colliding_with_enemy = false;
		}
	}else {
		speed = 0;
		spd -= (0.15 + (0.15 * (gun_level > 1)) + (0.2 * (gun_level > 2)) + (0.2 * (gun_level > 3)));
		move_towards_point(obj_player.x,obj_player.y,abs(spd));
		//collision with player
		if place_meeting(x,y,obj_player) or place_meeting(x,y,obj_player_mask) {
			instance_destroy();
			audio_play_sound(snd_reload,0,false);
			with obj_player {
				if gun_1._name = "回旋镖" {
					if gun_1.current_bullets < gun_1.bullets_per_bounce+obj_player.max_ammo_buff {
						gun_1.current_bullets += 1;
					}
				}else if gun_2._name = "回旋镖" {
					if gun_2.current_bullets < gun_2.bullets_per_bounce+obj_player.max_ammo_buff {
						gun_2.current_bullets += 1;
					}
				}else if gun_3._name = "回旋镖" {
					if gun_3.current_bullets < gun_3.bullets_per_bounce+obj_player.max_ammo_buff {
						gun_3.current_bullets += 1;
					}
				}
			}
		}
	}
	//damage enemy only once each direction
	if colliding_with_enemy = true {
		damage = 0 - global.damage_buff;
		if !place_meeting(x,y,obj_enemy_parent) {
			colliding_with_enemy = false;
		}
	}else {
		damage = init_damage;	
	}
	
	if obj_player.state = obj_player.state_blink or obj_player.state = obj_player.state_strike {
		spd = 0;
		speed = 0;
	}
}

if (gun_name = "悠悠球") {
	if obj_player.yoyo_gun.spread_number = 3 and offset_set = false {
		if spread_index = 0 {
			angle_offset = -obj_player.yoyo_gun.spread_angle;
		}else if spread_index = 1 {
			angle_offset = 0;
		}else if spread_index = 2 {
			angle_offset = obj_player.yoyo_gun.spread_angle;
		}
		ang = obj_player.angle+angle_offset;
	}
	
	for(i = 0; i < array_length(yoyo_array); i++) {
		if !place_meeting(x,y,yoyo_array[i]) {
			array_delete(yoyo_array,i,1);
		}
	}
	for(i = 0; i < array_length(yoyo_array2); i++) {
		if !place_meeting(x,y,yoyo_array2[i]) {
			array_delete(yoyo_array2,i,1);
		}
	}
	hspd = 0;
	vspd = 0;
	image_angle += 20;
	if dist < max_dist or reached_end = true {
		if reached_end = false {
			speed = 0;
			dist += yoyo_spd;
			x = obj_player.x + lengthdir_x(dist,ang-90);
			y = obj_player.y + lengthdir_y(dist,ang-90);
		}else if reached_end = true {
			if dist > yoyo_spd * 2 {
				dist -= retract_spd;
				x = obj_player.x + lengthdir_x(dist,ang-90);
				y = obj_player.y + lengthdir_y(dist,ang-90);
				if retract_spd < yoyo_spd * 2 {
					retract_spd  += yoyo_spd / 2;
				}
			}else {
				//collision with player
				instance_destroy();
				if spread_index = 0 {
					audio_play_sound(snd_reload,0,false);
				}
			}
		}
	}else {
		if retracted =  false {
			dist = max_dist;
			x = obj_player.x + lengthdir_x(dist,ang-90);
			y = obj_player.y + lengthdir_y(dist,ang-90);
		}else {
			reached_end = true;
			if !audio_is_playing(snd_yoyo2) {
				audio_play_sound(snd_yoyo2,0,false);
			}
		}
	}
	
	//retract
	with obj_player {
		if !(key_fire_projectile) or gun != yoyo_gun {
			if other.retracted = false {
				other.retracted = true;
				if !audio_is_playing(snd_yoyo2) and other.reached_end = true {
					audio_play_sound(snd_yoyo2,0,false);
				}
			}
		}
		
		//delete if not free
		if (state != state_free and state != state_freeze) {
			if other.retracted = false {
				other.retracted = true;
				if !audio_is_playing(snd_yoyo2) and other.reached_end = true {
					audio_play_sound(snd_yoyo2,0,false);
				}
			}
		}
	}
	
	if abs((obj_player.angle+angle_offset) - ang) > yoyo_spd * 2 {
		var ang_max_spd = yoyo_spd / 2;
	}else {
		var ang_max_spd = (abs((((obj_player.angle+angle_offset) - ang)/(yoyo_spd * 2)) + 0.1))*(yoyo_spd / 2);
	}
	
	//adjust with angle
	if ang < obj_player.angle + angle_offset {
		ang += ang_increase_speed;
		ang += ang_decrease_speed;
		if ang_increase_speed < ang_max_spd {
			ang_increase_speed += 0.15 * (5/obj_player.rotation_speed);
		}else {
			ang_increase_speed = ang_max_spd;
		}
		if ang_decrease_speed < 0 {
			ang_decrease_speed += 0.15 * (5/obj_player.rotation_speed);
		}else {
			ang_decrease_speed = 0;
		}
	}else if ang > obj_player.angle + angle_offset {
		ang += ang_increase_speed;
		ang += ang_decrease_speed;
		if ang_decrease_speed > -ang_max_spd {
			ang_decrease_speed -= 0.15;
		}else {
			ang_decrease_speed = -ang_max_spd;
		}
		if ang_increase_speed > 0 {
			ang_increase_speed -= 0.15;
		}else {
			ang_increase_speed = 0;
		}
	}
}

if (gun_name = "吸星者") {
	hspd = 0;
	vspd = 0;
	spd += 0.1;
	
	if suck_distance > 0 {
		suck_distance -= spd;
	}else {
		suck_distance = 0;
	}
	
	x = obj_player.x + lengthdir_x((22*(obj_player.starsucker_gun.level > 2)),obj_player.angle+90) + lengthdir_x(suck_distance,image_angle-(init_angle-obj_player.angle));
	y = obj_player.y + lengthdir_y((22*(obj_player.starsucker_gun.level > 2)),obj_player.angle+90) + lengthdir_y(suck_distance,image_angle-(init_angle-obj_player.angle));
	
	
	//move_towards_point(obj_player.x,obj_player.y,spd);
	
	if place_meeting(x,y,obj_player) or place_meeting(x,y,obj_player_mask) {
		instance_destroy();
	}
	
	//damage once per enemy
	if colliding_with_enemy = true {
		damage = 0;
	}else {
		damage = init_damage;	
	}
	
	//end animation
	if !scr_Animation_Complete() {
		image_index += 0.5;	
	}
	
	if obj_player.state = obj_player.state_blink or obj_player.state = obj_player.state_strike {
		speed = 0;
	}
}

if (gun_name = "史莱姆发射器") {
	image_angle -= hspd*2;
	if place_meeting(x,y+vspd,obj_ground_oneway) and !place_meeting(x,y-1,obj_ground_oneway) and vspd > 0 and num_of_bounces <= 0 and destroy_on_impact = true {
		alarm[0] = 1;	
	}
}

if (gun_name = "标枪") {
	if created = false {
		instance_destroy();	
	}
	vspd += obj_player.grv;
	image_angle = point_direction(x,y,x+hspd,y+vspd);
	
	if instance_exists(obj_ground) {
		if place_meeting(x,y,obj_ground) {
			depth = instance_nearest(x,y,obj_ground).depth + 1;	
		}else {
			depth = obj_player.depth + 1;	
		}
	}else {
		depth = obj_player.depth + 1;	
	}
}

if (gun_name = "小黄鸭水枪") {
	if (place_meeting(x,y+vspd,obj_ground_oneway) and !place_meeting(x,y-1,obj_ground_oneway) and vspd > 0 and global.drilltipbullets = false) {
		alarm[0] = 1;
	}
	image_xscale = 1;
	
	if global.key_fire_projectile and obj_player.water_gun.current_bullets > 0  {
		if !audio_is_playing(snd_watergun) {
			audio_play_sound(snd_watergun,0,false);
		}
	}else {
		if audio_is_playing(snd_watergun) {
			audio_stop_sound(snd_watergun);	
		}
	}
}

if (gun_name = "彩弹枪") {
	if (place_meeting(x,y+vspd,obj_ground_oneway) and !place_meeting(x,y-1,obj_ground_oneway) and vspd > 0 and global.drilltipbullets = false) {
		alarm[0] = 1;
	}
}

if (gun_name = "量子冲天炮" ) {
	
	//image_angle = obj_player.image_angle-90;
	//x = obj_player.x +laser_x;
	//y = obj_player.y +laser_y;
	
}

if destroyable = false and num_of_bounces <= 0 and !place_meeting(x,y,obj_ground) and gun_name != "标枪" {
	destroyable = true;	
}else if destroyable = false and num_of_bounces <= 0 and !place_meeting(x,y,obj_ground) {
	if created = true {
		destroyable = true;	
	}
}

if gun_name = "手雷发射器" or (gun_name = "The Portal") {
	destroyable = true;	
}

//rotate
if (gun_name = "The Portal") {
	spr_angle -= hspd*2;
	image_speed = 1;
	if global.key_fire_projectile_pressed and obj_player.gun_array[obj_player.current_gun] = obj_player.portal_gun {
		obj_player.x = x;
		obj_player.y = y;
		obj_player.hspeed = 0;
		obj_player.vspeed = 0;
		obj_player.gun_array[obj_player.current_gun].current_bullets = 1;
		instance_destroy();
	}
}

if (gun_name = "拳头枪") {
	if gun_level >= 2 {
		decrease_spd = 0.92;
	}
	if gun_level >= 4 {
		decrease_spd = 0.95;
	}
	if maxspd_frames > 0 {
		maxspd_frames -= 1;
	}else {
		if abs(hspd) > 0.05 or abs(vspd) > 0.05 {
			hspd *= decrease_spd;
			vspd *= decrease_spd;
		}else {
			hspd = 0;
			vspd = 0;
			//mask_index = spr_nothing;
			if still_time > 0 {
				still_time -= 1;
			}else {
				if image_alpha > 0 {
					image_alpha -= 0.05;	
				}else {
					alarm[0] = 1;
				}
			}
		}
	}
	
	//store prev x/y values for trail effect
	trail = not trail;
	
	if trail = false {
		x_prev_array[4] = x_prev_array[3];
		y_prev_array[4] = y_prev_array[3];
		x_prev_array[3] = x_prev_array[2];
		y_prev_array[3] = y_prev_array[2];
		x_prev_array[2] = x_prev_array[1];
		y_prev_array[2] = y_prev_array[1];
		x_prev_array[1] = x_prev_array[0];
		y_prev_array[1] = y_prev_array[0];
		x_prev_array[0] = x;
		y_prev_array[0] = y;
		show_debug_message(x_prev_array);
	}
}

if (gun_name = "等离子炮") {
	//depth = obj_player.depth+1;
	if created = false {
		//instance_destroy();	
	}
	
	//glow
	if glow_up = true and glow_alpha < 1 {
		glow_alpha += 0.025;	
	}else if glow_up = true {
		//glow_up = false;
	}else if glow_up = false and glow_alpha > 0 {
		glow_alpha -= 0.025;	
	}else if glow_up = false {
		glow_up = true;
	}
	
	image_angle += 5;
	
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
}

if (gun_name = "雪球加农炮") {
	colliding_with_enemy = false;
	image_angle += 10;
	destroy_on_impact = false;
}

if (gun_name = "气球枪") {
	if vspd < -4 {
		vspd = -4;	
	}
	//depth = obj_player.depth+1;
	if created = false {
		image_angle = obj_player.angle-90 + angle_offset;
		//instance_destroy();	
	}else {
		if abs(90 - image_angle) < abs(-270 - image_angle) {
			if image_angle < 90 {
				image_angle += 3;
			}else {
				image_angle = 90;
				hspd *= 0.75;
			}
		}else {
			if image_angle > -270 {
				image_angle -= 3;
			}else {
				image_angle = -270;
				hspd *= 0.75;
			}
		}
		//show_debug_message("angle: " + string(image_angle));
	}
	
	if obj_player.balloon_gun.spread_number = 1 {
		angle_offset = 0;
	}else if obj_player.balloon_gun.spread_number = 2 { //double shot
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
	
	if !place_meeting(x,y,obj_ground) and created = true and vspd < 0 {
		ground_free = true;	
	}
	
	if !global.drilltipbullets  {
		if place_meeting(x+hspd+hspd,y,obj_ground) and !place_meeting(x,y,obj_ground)  and created = true {
			hspd *= -1;
		}
	
		if ground_free = true and place_meeting(x,y+vspd,obj_ground) and vspd < 0 and created = true {
			while !place_meeting(x,y+sign(vspd),obj_ground) {
				y += sign(vspd);
			}
			if abs(vspd) > 0.2 {
				vspd *= -0.7;
			}else {
				vspd = 0;
			}	
		}
	}
	
	if place_meeting(x,y,obj_spike) and created = true {
		alarm[0] = 1;	
	}
}

if (gun_name = "磁力飞轮") {
	if stuck = false or summoned = true {
		image_angle += 10;
	}
	if place_meeting(x+hspd,y+vspd,obj_ground) and summoned = false and stuck = false {
		while !place_meeting(x+sign(hspd),y+sign(vspd),obj_ground) {
			x+=hspd;
			y+=vspd;
		}
		audio_play_sound(snd_disk_clank,0,false);
		hspd = 0;
		vspd = 0;
		stuck = true;
	}
	
	if summoned = true {
		if summon_speed < 24 {
			summon_speed += 1;
		}
		move_towards_point(obj_player.x,obj_player.y,summon_speed);
		if place_meeting(x+hspeed,y+vspeed,obj_player) or place_meeting(x+hspd,y+vspd,obj_player_mask) {
			instance_destroy();
			with obj_player {
				if state != state_freeze and state != state_parachute {
					var disks = 0;
					with obj_projectile {
						if gun_name = "磁力飞轮" {
							disks += 1;
						}
					}
					if disks = 0 { //frisbee_gun.current_bullets = frisbee_gun.bullets_per_bounce+max_ammo_buff {
						speed = 0;
						motion_add(angle - 90, vsp_basicjump*1.1);
					}
					scr_Screen_Shake(3,6,true);
				}
			}
		}
	}
	
	trail = not trail;
	
	if trail = false {
		x_prev_array[4] = x_prev_array[3];
		y_prev_array[4] = y_prev_array[3];
		x_prev_array[3] = x_prev_array[2];
		y_prev_array[3] = y_prev_array[2];
		x_prev_array[2] = x_prev_array[1];
		y_prev_array[2] = y_prev_array[1];
		x_prev_array[1] = x_prev_array[0];
		y_prev_array[1] = y_prev_array[0];
		x_prev_array[0] = x;
		y_prev_array[0] = y;
	}
}

//missile
if (gun_name = "追踪飞镖") {
	//speed up
	if speed < 6 + (6 * (gun_level > 1)) {
		speed += 0.15 + (0.15 * (gun_level > 1));	
	}
	
	//lock on to enemy
	if collision_circle(x,y,160,obj_enemy_parent,false,true) != noone {
		closest_enemy = instance_nearest(x,y,obj_enemy_parent);
	}else {
		closest_enemy = noone;
	}
	
	//rotate
	if closest_enemy != noone {
		//num_of_bounces = 0;
		damage = init_damage;
		scr_Gradually_Turn(self.id,closest_enemy,45,1);
		direction = image_angle;
		if place_meeting(x,y,closest_enemy) {
			//instance_destroy();	
		}
	}else {
		direction = image_angle;
		
		if place_meeting(x,y+vspeed,obj_ground) and num_of_bounces > 0  {
			while !place_meeting(x,y+sign(vspeed),obj_ground) {
				y += sign(vspeed);
			}
			image_angle = point_direction(x,y,x+hspeed,y-vspeed);
			direction = image_angle;
			num_of_bounces -= 1;
		}
		if place_meeting(x+hspeed,y,obj_ground) and num_of_bounces > 0  {
			while !place_meeting(x+sign(hspeed),y,obj_ground) {
				x += sign(hspeed);
			}
			image_angle = point_direction(x,y,x-hspeed,y+vspeed);
			direction = image_angle;
			num_of_bounces -= 1;
		}
	}
}

if (gun_name = "维和者") or (gun_name = "维和者") or (gun_name = "维和者") 
or (gun_name = "维和者") or (gun_name = "维和者") or (gun_name = "维和者") {
	if place_meeting(x,y,obj_ground) {
		if global.drilltipbullets = false {
			depth = 10;	
		}else {
			depth = obj_player.depth+5;
		}
	}
}