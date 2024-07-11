// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Projectile_Bounce(name_string){
	//bounces
	ground_below = false;
	with obj_player {
		if place_meeting(x,y+16,obj_ground) or place_meeting(x,y+16,obj_ground_oneway) and other.gun_name != "Puncher" {
			other.ground_below = true;
		}
	}
	
	if gun_name != "Missile Launcher" {
		if ground_below = true and gun_name != name_string {
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
				}else if (gun_name != "The Portal" ) {
					image_angle = point_direction(x,y,x+hspd,y+vspd);
				}
			}else if (place_meeting(x,y+vspd,obj_ground) and vspd > 0 and num_of_bounces > 0 )
			or (place_meeting(x,y+sign(vspd),obj_ground_oneway) and vspd > 0 and num_of_bounces > 0 and gun_name != "Puncher") { //top
				while !place_meeting(x,y+sign(vspd),obj_ground) and (!place_meeting(x,y+sign(vspd),obj_ground_oneway) and gun_name != "Puncher") {
					y += sign(vspd);
				}
				vspd *= -bounce_amount;
				num_of_bounces -= 1;
				if (gun_name = "Grenade Launcher") {
					audio_play_sound(snd_grenade_bounce, 0, false);
					image_index = 1;
					alarm[1] = 5;
				}else if (gun_name != "The Portal" ) {
					image_angle = point_direction(x,y,x+hspd,y+vspd);
				}
			}
		
			
		}else if gun_name != name_string {
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
				}else if (gun_name != "The Portal" ) {
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
				}else if (gun_name != "The Portal" ) {
					image_angle = point_direction(x,y,x+hspd,y+vspd);	
				}
	
			}	
		}
	}else {
		if ground_below = true and gun_name != name_string {
			if ((place_meeting(x,y+vspeed,obj_ground) and vspeed < 0) and num_of_bounces > 0 ) {
				while !place_meeting(x,y+sign(vspeed),obj_ground) {
					y += sign(vspeed);
				}
				vspeed *= -bounce_amount;
				num_of_bounces -= 1;
			}else if (place_meeting(x,y+vspeed,obj_ground) and vspeed > 0 and num_of_bounces > 0 )
			or (place_meeting(x,y+sign(vspeed),obj_ground_oneway) and vspeed > 0 and num_of_bounces > 0 and gun_name != "Puncher") { //top
				while !place_meeting(x,y+sign(vspeed),obj_ground) and (!place_meeting(x,y+sign(vspeed),obj_ground_oneway) and gun_name != "Puncher") {
					y += sign(vspeed);
				}
				vspeed *= -bounce_amount;
				num_of_bounces -= 1;
			}
		
			
		}else if gun_name != name_string {
			if hspeed = 0 {
				if image_angle < -90 {
					hspeed = -1;
				}else {
					hspeed = 1;
				}
				vspeed = 1;
			}
			//left/right
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

	destroyable = true;
	if num_of_bounces > 0 {
		destroyable = false;
	}
}