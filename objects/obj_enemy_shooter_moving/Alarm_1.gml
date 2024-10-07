/// @description Insert description here
// You can write your code in this editor

if (!is_dead) and !megabounce_freeze {
	sprite_index = spr_enemy_shooter_cannon2;
	image_index = 0;
	alarm_set(3, 40); // Create projectile
	alarm_set(2, room_speed); // Reset animation
	alarm_set(1, (4 * room_speed)); // Schedule next attack
}


