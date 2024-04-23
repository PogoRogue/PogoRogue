x += hspd;
y += vspd;

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
		if (gun_name = "Bouncy Ball Blaster") and num_of_bounces < max_num_of_bounces {
			damage = init_damage * (2*(max_num_of_bounces-num_of_bounces));
			image_index = max_num_of_bounces-num_of_bounces;
		}else if (gun_name = "Javelins") {
			if created = true {
				damage = init_damage + ((temp_charge/temp_charge_max)*12);	
			}
		}
	}
	
	//destroy if far enough away from camera
	if  !(point_in_rectangle(x,y,obj_camera.x-camera_width-(padding*10),obj_camera.y-camera_height-(padding*10),obj_camera.x+camera_width+(padding*10),obj_camera.y+camera_height+(padding*10))) {
		instance_destroy();
	}
}

//destroy when touching ground
if (destroy_on_impact and num_of_bounces <= 0 and destroyable = true) {
	if (place_meeting(x,y,obj_ground)) and global.drilltipbullets = false {
		if gun_name = "Paintball Gun" {
			alarm[0] = 1;
			//splatter code here
		}else if gun_name = "Water Gun" {
			alarm[0] = 1;
			//sprite_index = spr_projectile_water_droplet;
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
if (gun_name = "Grenade Launcher") {
	image_angle -= hspd*2;
}

//bounces
//bottom
if ((place_meeting(x,y+vspd,obj_ground) and vspd < 0) and num_of_bounces > 0 ) {
	while !place_meeting(x,y+sign(vspd),obj_ground) {
		y += sign(vspd);
	}
	vspd *= -bounce_amount;
	num_of_bounces -= 1;
	if (gun_name = "Grenade Launcher") {
		audio_play_sound(snd_grenade_bounce, 0, false);
		image_index = 1;
		alarm[1] = 5;
	}else {
		image_angle = point_direction(x,y,x+hspd,y+vspd);
	}
	
}else if (place_meeting(x,y+vspd,obj_ground) and vspd > 0 and num_of_bounces > 0 )
or (place_meeting(x,y+vspd,obj_ground_oneway) /*and !place_meeting(x,y-1,obj_ground_oneway)*/ and vspd > 0 and num_of_bounces > 0) { //top
	while !place_meeting(x,y+sign(vspd),obj_ground) and !place_meeting(x,y+sign(vspd),obj_ground_oneway) {
		y += sign(vspd);
	}
	vspd *= -bounce_amount;
	num_of_bounces -= 1;
	if (gun_name = "Grenade Launcher") {
		audio_play_sound(snd_grenade_bounce, 0, false);
		image_index = 1;
		alarm[1] = 5;
	}else {
		image_angle = point_direction(x,y,x+hspd,y+vspd);
	}

	
}else if ((place_meeting(x,y+vspd,obj_ground_oneway) and !place_meeting(x,y-1,obj_ground_oneway) and vspd > 0) and num_of_bounces <= 0 and max_num_of_bounces > 0 and global.drilltipbullets = false) 
or (place_meeting(x,y,obj_player_mask) and gun_name = "Grenade Launcher" and global.drilltipbullets = false) 
or (place_meeting(x,y,obj_player) and gun_name = "Grenade Launcher" and global.drilltipbullets = false) {
	instance_destroy();
}

//left
if ((place_meeting(x+hspd,y,obj_ground)) and hspd > 0 and num_of_bounces > 0 ) {
	while !place_meeting(x+sign(hspd),y,obj_ground) {
		x += sign(hspd);
	}
	hspd *= -bounce_amount;
	num_of_bounces -= 1;
	if (gun_name = "Grenade Launcher") {
		audio_play_sound(snd_grenade_bounce, 0, false);
		image_index = 1;
		alarm[1] = 3;
	}else {
		image_angle = point_direction(x,y,x+hspd,y+vspd);
	}

}
//right
if ((place_meeting(x+hspd,y,obj_ground)) and hspd < 0 and num_of_bounces > 0 ) { 
	while !place_meeting(x+sign(hspd),y,obj_ground) {
		x += sign(hspd);
	}
	hspd *= -bounce_amount;
	num_of_bounces -= 1;
	if (gun_name = "Grenade Launcher") {
		audio_play_sound(snd_grenade_bounce, 0, false);
		image_index = 1;
		alarm[1] = 5;
	}else {
		image_angle = point_direction(x,y,x+hspd,y+vspd);	
	}
	
}



//missile
if (gun_name = "Missile Launcher") {
	//speed up
	if speed < 8 {
		speed += 0.25;	
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
		if place_meeting(x,y+vspeed,obj_ground_oneway) and !place_meeting(x,y,obj_ground_oneway) and vspeed > 0 and num_of_bounces <= 0 and global.drilltipbullets = false{
			instance_destroy();	
		}else if place_meeting(x,y+vspeed,obj_ground_oneway) and !place_meeting(x,y,obj_ground_oneway) and vspeed > 0 and num_of_bounces > 0  {
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

if (gun_name = "Boomerangs") {
	hspd = 0;
	vspd = 0;
	image_angle += 20;
	if spd > 0 {
		spd -= 0.25;
		speed = spd;
		direction = angle;
		if spd <= 0 {
			colliding_with_enemy = false;
		}
	}else {
		speed = 0;
		spd -= 0.25;
		move_towards_point(obj_player.x,obj_player.y,abs(spd));
		//collision with player
		if place_meeting(x,y,obj_player) or place_meeting(x,y,obj_player_mask) {
			instance_destroy();
			audio_play_sound(snd_reload,0,false);
			with obj_player {
				if gun_1._name = "Boomerangs" {
					if gun_1.current_bullets < gun_1.bullets_per_bounce+obj_player.max_ammo_buff {
						gun_1.current_bullets += 1;
					}
				}else if gun_2._name = "Boomerangs" {
					if gun_2.current_bullets < gun_2.bullets_per_bounce+obj_player.max_ammo_buff {
						gun_2.current_bullets += 1;
					}
				}else if gun_3._name = "Boomerangs" {
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
	
	if obj_player.state = obj_player.state_blink {
		spd = 0;
		speed = 0;
	}
}

if (gun_name = "Yo-yo") {
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
			dist += 8;
			x = obj_player.x + lengthdir_x(dist,ang-90);
			y = obj_player.y + lengthdir_y(dist,ang-90);
		}else if reached_end = true {
			if dist > 16 {
				dist -= retract_spd;
				x = obj_player.x + lengthdir_x(dist,ang-90);
				y = obj_player.y + lengthdir_y(dist,ang-90);
				if retract_spd < 16 {
					retract_spd  += 4;
				}
			}else {
				//collision with player
				instance_destroy();
				audio_play_sound(snd_reload,0,false);
			}
		}
	}else {
		if retracted =  false {
			dist = max_dist;
			x = obj_player.x + lengthdir_x(dist,ang-90);
			y = obj_player.y + lengthdir_y(dist,ang-90);
		}else {
			reached_end = true;
		}
	}
	
	//retract
	with obj_player {
		if !(key_fire_projectile) or gun != yoyo_gun {
			other.retracted = true;
		}
		
		//delete if not free
		if (state != state_free and state != state_freeze) {
			other.retracted = true;
		}
	}
	
	if abs(obj_player.angle - ang) > 16 {
		var ang_max_spd = 4;
	}else {
		var ang_max_spd = (abs(((obj_player.angle - ang)/16) + 0.1))*4;
	}
	
	//adjust with angle
	if ang < obj_player.angle {
		ang += ang_increase_speed;
		ang += ang_decrease_speed;
		if ang_increase_speed < ang_max_spd {
			ang_increase_speed += 0.15;
		}else {
			ang_increase_speed = ang_max_spd;
		}
		if ang_decrease_speed < 0 {
			ang_decrease_speed += 0.15;
		}else {
			ang_decrease_speed = 0;
		}
	}else if ang > obj_player.angle {
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

if (gun_name = "Star Sucker") {
	hspd = 0;
	vspd = 0;
	spd += 0.1;
	
	if suck_distance > 0 {
		suck_distance -= spd;
	}else {
		suck_distance = 0;
	}
	
	x = obj_player.x + lengthdir_x(suck_distance,image_angle-(init_angle-obj_player.angle));
	y = obj_player.y + lengthdir_y(suck_distance,image_angle-(init_angle-obj_player.angle));
	
	
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
	
	if obj_player.state = obj_player.state_blink {
		speed = 0;
	}
}

if (gun_name = "Slime Blaster") {
	image_angle -= hspd*2;
	if place_meeting(x,y+vspd,obj_ground_oneway) and !place_meeting(x,y-1,obj_ground_oneway) and vspd > 0 and num_of_bounces <= 0 and destroy_on_impact = true {
		alarm[0] = 1;	
	}
}

if (gun_name = "Javelins") {
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

if (gun_name = "Water Gun") {
	if (place_meeting(x,y+vspd,obj_ground_oneway) and !place_meeting(x,y-1,obj_ground_oneway) and vspd > 0 and global.drilltipbullets = false) {
		alarm[0] = 1;
	}
	image_xscale = 1;
}

if (gun_name = "Paintball Gun") {
	if (place_meeting(x,y+vspd,obj_ground_oneway) and !place_meeting(x,y-1,obj_ground_oneway) and vspd > 0 and global.drilltipbullets = false) {
		alarm[0] = 1;
	}
}

if (gun_name = "Laser Gun" ) {
	
	//image_angle = obj_player.image_angle-90;
	//x = obj_player.x +laser_x;
	//y = obj_player.y +laser_y;
	
}

if destroyable = false and num_of_bounces <= 0 and !place_meeting(x,y,obj_ground) and gun_name != "Javelins" {
	destroyable = true;	
}else if destroyable = false and num_of_bounces <= 0 and !place_meeting(x,y,obj_ground) {
	if created = true {
		destroyable = true;	
	}
}

if gun_name = "Grenade Launcher" {
	destroyable = true;	
}