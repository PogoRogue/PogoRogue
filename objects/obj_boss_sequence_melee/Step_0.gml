/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

player_direction = sign(player.x - initial_x);

if(is_dead) {
	current_target = SLIME_MELEE_TARGETS.ORIGIN;
}

switch(current_target) {
	case SLIME_MELEE_TARGETS.ABOVE:
		x = lerp(x, player.x - (player_direction * 30), 0.02);
		y = lerp(y, player.y + y_diff, 0.02);
		break;
	case SLIME_MELEE_TARGETS.BELOW:
		x = lerp(x, player.x, 0.02);
		y = lerp(y, player.y - y_diff, 0.02);
		break;
	case SLIME_MELEE_TARGETS.ORIGIN:
		x = lerp(x, initial_x, 0.03);
		y = lerp(y, initial_y, 0.03);
		break;
}

if(instance_exists(melee_arm) && is_dead) {
	melee_arm.is_dead = true;
}
