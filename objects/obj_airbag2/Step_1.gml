/// @description Insert description here
// You can write your code in this editor

activated_sound = snd_carhorn;

// Inherit the parent event
event_inherited();

y += vspd;

if vspd > 0 {
	vspd -= 0.25;
	x += obj_player.hspeed;
	if obj_player.vspeed > 0 {
		y += obj_player.vspeed;
	}
}

if vspd < 4 {
	image_speed = 1;	
	mask_index = spr_airbag;
}

if sprite_index = spr_airbag_spawning and scr_Animation_Complete() and spawned = false {
	sprite_index = spr_airbag;
	mask_index = spr_airbag;
	spawned = true;
}

propeller_index += 0.5;

//bob up and down
if sprite_index = spr_airbag {
	if y_add > -4 and y_up = true {
		y_add_spd = (4 - abs(y_add))/8 + 0.025;
		y_add -= y_add_spd;

	}else if y_up = true {
		y_up = false;
		y_add_spd = 0;
	}
	if y_add < 4 and y_up = false {
		y_add_spd = (4 - abs(y_add))/8 + 0.025;
		y_add += y_add_spd;
	}else if y_up = false {
		y_up = true;
		y_add_spd = 0;
	}
}

if !place_meeting(x,y,obj_player) and !place_meeting(x,y,obj_player_mask) and mask_index = spr_airbag {
	not_meeting = true;
}

while position_meeting(x,y+20,obj_ground) {
	y -= 1;
}

while position_meeting(bbox_left,y,obj_ground) and !position_meeting(bbox_right,y,obj_ground) {
	x += 1;
}

while !position_meeting(bbox_left,y,obj_ground) and position_meeting(bbox_right,y,obj_ground) {
	x -= 1;
}

if place_meeting(x,y,obj_room_gate_open) {
	depth = instance_place(x,y,obj_room_gate_open).depth - 1;
}

if place_meeting(x,y,obj_boss_brick) {
	depth = instance_place(x,y,obj_boss_brick).depth + 20;
}