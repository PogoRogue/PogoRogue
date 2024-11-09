/// @description Player collision
if instance_exists(obj_player_mask) {
	if place_meeting(x+hspeed,y+vspeed,obj_player_mask) and free = true {
		scr_Screen_Shake(3,3,false);
		//audio_play_sound(snd_volleyball,0,false);
		scale = 1.25;
		speed = 8;
		direction = point_direction(obj_player_mask.x,obj_player_mask.y,x + lengthdir_x(22,obj_player.angle+90),y + lengthdir_y(22,obj_player.angle+90));
		var prev_spd = speed;
		var prev_dir = direction;
		speed = prev_spd;
		direction = prev_dir;
		hspeed += obj_player.hspeed/2;
		if obj_player.vspeed < 0 {
			vspeed += obj_player.vspeed/2;
		}
		if !audio_is_playing(snd_volleyball_hit) {
			audio_play_sound(snd_volleyball_hit,0,false);
		}
		free = false;
	}
}

/*
if instance_exists(obj_projectile) {
	if place_meeting(x+hspeed,y+vspeed,obj_projectile) and free = true {
		var proj_obj = instance_place(x+hspeed,y+vspeed,obj_projectile);
		if !scr_In_Array(projectile_array,proj_obj) {
			scr_Screen_Shake(3,3,false);
			//audio_play_sound(snd_volleyball,0,false);
			scale = 1.25;
			speed = 8;
			direction = point_direction(proj_obj.x,proj_obj.y,x,y);
			var prev_spd = speed;
			var prev_dir = direction;
			speed = prev_spd;
			direction = prev_dir;
			hspeed += proj_obj.hspeed/4;
			hspeed += proj_obj.hspd/4;
			vspeed += proj_obj.vspeed/4;
			vspeed += proj_obj.vspd/4;
			array_resize(projectile_array,array_length(projectile_array)+1)
			projectile_array[array_length(projectile_array)-1] = proj_obj;

			if !audio_is_playing(snd_volleyball_hit) {
				audio_play_sound(snd_volleyball_hit,0,false);
			}
			free = false;
		}
	}
}*/

if !place_meeting(x,y,obj_player_mask) {
	free = true;	
}