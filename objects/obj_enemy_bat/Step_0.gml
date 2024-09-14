/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if obj_player.y <= y and abs(distance_to_object(obj_player)) < 300 and falling = false and perching = true {
	falling = true;
	alarm[1] = 1;
}

if falling = true {
	vspd += grav;
	y += vspd;
}

if perching = false and distance_to_point(obj_player.x+lengthdir_x(22,obj_player.angle+90),obj_player.y+lengthdir_y(22,obj_player.angle+90)) > 16 and !is_dead {
	if current_spd < follow_spd {
		current_spd += 0.25;
	}else {
		current_spd = follow_spd;
	}
	
	sprite_index = spr_enemy_bat;
	image_speed = 1;
	falling = false;
	move_towards_point(obj_player.x+lengthdir_x(22,obj_player.angle+90),obj_player.y+lengthdir_y(22,obj_player.angle+90),current_spd);
}

if perching = false and distance_to_point(obj_player.x+lengthdir_x(22,obj_player.angle+90),obj_player.y+lengthdir_y(22,obj_player.angle+90)) <= 16 and !is_dead {
	sprite_index = spr_enemy_bat;
	image_speed = 1;
	falling = false;
	move_towards_point(obj_player.x+lengthdir_x(22,obj_player.angle+90),obj_player.y+lengthdir_y(22,obj_player.angle+90),follow_spd/4);
}

if obj_player.x > x {
	image_xscale = -1;	
}else {
	image_xscale = 1;	
}