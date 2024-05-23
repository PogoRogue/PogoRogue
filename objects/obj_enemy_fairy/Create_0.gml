/// @description Insert description here
// You can write your code in this editor

// Only spawn 1 in 25 fairies (4%)
random_set_seed(global.seed + global.enemy_number);
if(irandom(24) > 0) {
	instance_destroy(self);
}
random_set_seed(global.seed);

// Inherit the parent event
event_inherited();

player = instance_nearest(x, y, obj_player);
vision_range = 150;
detected = false;
vanish_timer = room_speed * 5;
enemy_coin_bonus = 50;
spd = 2;

sparkle_positions = [{x: 8, y: 8}, {x: -8, y: 8}, {x: 8, y: -8}, {x: -8, y: -8}];
current_sparkle_position = 0;
alarm_set(2, room_speed);
