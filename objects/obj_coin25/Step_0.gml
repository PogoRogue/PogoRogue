/// @description Insert description here
// You can write your code in this editor

if room != room_shop {
	if instance_exists(obj_slot_machine) {
		follow_object = obj_slot_machine;
	}else if instance_exists(obj_slot_machine2) {
		follow_object = obj_slot_machine2;
	}else {
		follow_object = noone;	
	}
}else {
	follow_object = obj_shopkeeper;	
}

if obj_player.state != obj_player.state_blink and obj_player.state != obj_player.state_strike {
	if (instance_exists(follow_object)) {
		move_towards_point(follow_object.x,follow_object.y,spd);
		spd = lerp(spd,max_spd,0.05);
	}
}else {
	speed = 0;
	spd = 0;
}	

//destroy on contact
if (instance_exists(follow_object)) {
	if place_meeting(x+hspeed,y+vspeed,follow_object) {
		instance_destroy();
	}
}

if !place_meeting(x,y,obj_enemy_parent) {
	colliding_with_enemies = false;
}

x += obj_player.hspeed;
y += obj_player.vspeed;