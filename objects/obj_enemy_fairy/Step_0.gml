/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(!detected && distance_to_object(player) < vision_range) {
	detected = true;
	alarm_set(1, vanish_timer);
}

if(is_dead) {
	spd = 0;
}

if(detected) {
	direction = point_direction(player.x, player.y, x, y);
	speed = spd;
	vspeed += 0.75 * sign(spd);
	image_xscale = hspeed > 0 ? 1 : -1;
	
	if(!place_meeting(x + hspeed, y, obj_ground_parent)) {
		x += hspeed;
	}
	
	if(!place_meeting(x, y + vspeed, obj_ground_parent)) {
		y += vspeed;
	}
	
	speed = 0;
}

random_set_seed(global.seed + global.fairy_amount);

if hp <= 0 and created_fairy_items = false {
	if skin_color = "green" {
		heart_chance = 0;
		buff_chance = 0;
		weapon_chance = 0;
		pickup_chance = 100;
		num_of_coins = 0;

		random_items = scr_Random_Item_Drops();
		random_set_seed(global.seed + global.fairy_amount);
		Create_Item_Drops(random_items);	
	}
	
	if skin_color = "blue" {
		heart_chance = 0;
		buff_chance = 0;
		weapon_chance = 100;
		pickup_chance = 0;
		num_of_coins = 0;

		random_items = scr_Random_Item_Drops();
		random_set_seed(global.seed + global.fairy_amount);
		Create_Item_Drops(random_items);	
	}	
	
	if skin_color = "pink" {
		heart_chance = 50;
		buff_chance = 0;
		weapon_chance = 0;
		pickup_chance = 0;
		enemy_coin_bonus = 50;
		num_of_coins = 50;

		random_items = scr_Random_Item_Drops();
		random_set_seed(global.seed + global.fairy_amount);
		Create_Item_Drops(random_items);	
	}	
	created_fairy_items = true;
}

random_set_seed(global.seed);

if place_meeting(x,y,obj_room_gate_close) {
	instance_destroy();	
}