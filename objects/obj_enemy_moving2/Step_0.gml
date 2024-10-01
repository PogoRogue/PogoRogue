/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if firing = true {
	
	image_speed = -1;
	firing = false;
	firing_cooldown = true;
	alarm[1] = 120;
	alarm[3] = 60;
	image_index = 0;
	image_speed = 1;
	sprite_index = spr_walk_enemy_idle_1;
	current_state = ROBOT_STATES.IDLE;
	if draw_laser = false {
		draw_laser = true;
		
	}
	
	dist_to_wall = 0;
	while !position_meeting(x+dist_to_wall,y-22,obj_ground) {
		dist_to_wall += image_xscale;
	}
}

if image_xscale = 1 and firing_cooldown = false {
	if abs(obj_player.x - x) < 400 and obj_player.x > x and abs(obj_player.y - y) < 16 {
		firing = true;
		image_index = 0;
		//sprite_index = spr_walk_enemy_idle_1_shooting;
		image_speed = 1;
	}
}else if image_xscale = -1 and firing_cooldown = false {
	if abs(obj_player.x - x) < 400 and obj_player.x < x and abs(obj_player.y - y) < 16 {
		firing = true;
		image_index = 0;
		//sprite_index = spr_walk_enemy_idle_1_shooting;
		image_speed = 1;
	}
}

if draw_laser {
	if laser_alpha < 1 {
		laser_alpha += 1/60;	
	}
}else {
	if laser_alpha > 0 {
		laser_alpha -= 1/10;	
	}
}