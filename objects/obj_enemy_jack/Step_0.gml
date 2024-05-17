/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp_percent = (hp / hp_max) * 100;

// Open chest when hit for first time
if(!is_open && hp < hp_max) {
	instance_create_depth(x, y, depth, obj_enemy_jack_hitbox);
	is_open = true;
	body_subimg = 0;
}

if(!is_open) {
	image_index = 0;
} else {
	// Update clown animation variables
	body_pos_x += 0.05;
	body_pos_y += 0.15;
	body_subimg += 16 / room_speed;
}
