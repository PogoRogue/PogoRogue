/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if firing = true {
	instance_create_depth(x+(12*image_xscale),y-21,depth+1,obj_robot_laser,{h_spd: image_xscale * 24,image_xscale: image_xscale,parent: self});
	image_speed = -1;
	firing = false;
	firing_cooldown = true;
	alarm[1] = 60;
	image_index = 0;
	image_speed = 1;
	//sprite_index = spr_walk_enemy_walk_1;
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