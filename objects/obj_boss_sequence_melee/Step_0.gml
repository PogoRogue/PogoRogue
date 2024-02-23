/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

player_direction = sign(player.x - initial_x);

if(is_approaching) {
	x = lerp(x, player.x - (player_direction * 30), 0.02);
	y = lerp(y, player.y + y_diff, 0.02);
} else {
	x = lerp(x, player.x, 0.02);
	y = lerp(y, player.y - y_diff, 0.02);
}

if(instance_exists(melee_arm) && is_dead) {
	melee_arm.is_dead = true;
}
