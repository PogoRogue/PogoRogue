/// @description Insert description here
// You can write your code in this editor
global.fairy_amount +=  1;
// Only spawn 1 in 25 fairies (4%)
random_set_seed(global.seed + global.fairy_amount + global.enemy_number);
if(irandom(24) > 0) { //24
	instance_destroy(self);
}

random_set_seed(global.seed);

// Inherit the parent event
event_inherited();


player = instance_nearest(x, y, obj_player);
vision_range = 150;
detected = false;
vanish_timer = room_speed * 5;

spd = 2;

sparkle_positions = [{x: 8, y: 8}, {x: -8, y: 8}, {x: 8, y: -8}, {x: -8, y: -8}];
current_sparkle_position = 0;
alarm_set(2, room_speed);

is_dead = false;
created_fairy_items = false;

random_set_seed(global.seed + global.fairy_amount + global.enemy_number);

skin_color = choose("pink","blue","green");
fairy_explosion = spr_nothing;

if skin_color = "pink" {
	sprite_index = spr_enemy_fairy_fly;
	fairy_explosion = spr_enemy_fairy_vanish;
	enemy_coin_bonus = 50;
	
	heart_chance = 0;
	buff_chance = 0;
	weapon_chance = 0;
	pickup_chance = 0;
	num_of_coins = 0;

	random_items = scr_Random_Item_Drops();
}else if skin_color = "blue" {
	sprite_index = spr_enemy_fairy_fly_blue;
	fairy_explosion = spr_enemy_fairy_vanish_blue;
	enemy_coin_bonus = 0;
	
	heart_chance = 0;
	buff_chance = 0;
	weapon_chance = 0;
	pickup_chance = 0;
	num_of_coins = 0;

	random_items = scr_Random_Item_Drops();
}else if skin_color = "green" {
	sprite_index = spr_enemy_fairy_fly_green;
	fairy_explosion = spr_enemy_fairy_vanish_green;
	enemy_coin_bonus = 0;
	
	heart_chance = 0;
	buff_chance = 0;
	weapon_chance = 0;
	pickup_chance = 0;
	num_of_coins = 0;

	random_items = scr_Random_Item_Drops();
}

random_set_seed(global.seed);