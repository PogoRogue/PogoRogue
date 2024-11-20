/// @description Player collision
if instance_exists(obj_player_mask) {
	if place_meeting(x+hspeed,y+vspeed,obj_player_mask) and free = true {
		scr_Screen_Shake(3,3,false);
		//audio_play_sound(snd_volleyball,0,false);
		scr_Player_Damaged(damage);
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
		audio_play_sound(snd_basketball_bounce,0,false);
		free = false;
	}
}


if instance_exists(obj_basketball_hoop_large_mask_left) {
	if place_meeting(x+hspeed,y+vspeed,obj_basketball_hoop_large_mask_left) and !place_meeting(x,y-1,obj_basketball_hoop_large_mask_left) and vspeed > 0 and above_hoop = true {
		//audio_play_sound(snd_volleyball,0,false);
		var current_obj = instance_place(x+hspeed,y+vspeed,obj_basketball_hoop_large_mask_left);
		scale = 1.25;
		speed = speed * 0.7;
		speed = max(speed,1.5);
		direction = point_direction(current_obj.x,current_obj.y,x,y);
		var prev_spd = speed;
		var prev_dir = direction;
		speed = prev_spd;
		direction = prev_dir;
		audio_play_sound(snd_basketball_bounce,0,false);
	}
}

if !place_meeting(x,y,obj_player_mask) and !place_meeting(x,y,obj_basketball_hoop_large_mask_left) {
	free = true;	
}

if hp < 0 {
	hp = 0;
}

//update health
if size = 4 {
	global.basketball_health = hp;
}else if size = 3 {
	if ball_index = 1 {
		global.soccer_health1 = hp;
	}else if ball_index = 2 {
		global.soccer_health2 = hp;
	}
}else if size = 2 {
	if current_ball_num = 1 {
		global.volleyball_health1 = hp;
	}else if current_ball_num = 2 {
		global.volleyball_health2 = hp;
	}else if current_ball_num = 3 {
		global.volleyball_health3 = hp;
	}else if current_ball_num = 4 {
		global.volleyball_health4 = hp;
	}
}else if size = 1 {
	if current_ball_num = 1 {
		global.tennis_health1 = hp;
	}else if current_ball_num = 2 {
		global.tennis_health2 = hp;
	}else if current_ball_num = 3 {
		global.tennis_health3 = hp;
	}else if current_ball_num = 4 {
		global.tennis_health4 = hp;
	}else if current_ball_num = 5 {
		global.tennis_health5 = hp;
	}else if current_ball_num = 6 {
		global.tennis_health6 = hp;
	}else if current_ball_num = 7 {
		global.tennis_health7 = hp;
	}else if current_ball_num = 8 {
		global.tennis_health8 = hp;
	}
}