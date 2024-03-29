/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

enum SLIME_MELEE_TARGETS {
	ABOVE,
	BELOW,
	ORIGIN,
}

current_target = SLIME_MELEE_TARGETS.ABOVE;

player = instance_nearest(x, y, obj_player);
y_diff = -200;
initial_x = x;
initial_y = y;
player_direction = sign(player.x - initial_x = x);
melee_arm = instance_create_depth(x, y, depth + 1, obj_boss_sequence_melee_arm);
is_approaching = true;

alarm_set(1, 2.5 * room_speed);
