/// @description Perform current ability
// You can write your code in this editor

switch(ability) {
	case BOSS3_ABILITIES.GROUND_POUND:
		spring_force = 175;
		oscillation = 0;
		alarm_set(3, room_speed / 4);
		break;
	case BOSS3_ABILITIES.BULLET_BLAST:
		var _burst = instance_create_layer(x, y, "Instances", obj_pattern_template);
		_burst.spread = 360;
		_burst.repeats = 0;
		_burst.amount = 12;
		_burst.spd = 2;
		audio_play_sound(snd_bulletblast_enemy,0,false);
		break;
	case BOSS3_ABILITIES.SHIELD:
		if(!instance_exists(obj_shield_plus)) {
			/*var _shield = instance_create_depth(x, y, depth - 15, obj_shield_plus);
			_shield.parent = self;
			_shield.depth = depth - 8;*/
		}
		break;
}

if(instance_exists(controller) && controller.current_state == BOSS3_STATES.ATTACK_4) {
	alarm_set(4, room_speed);
}

alarm_set(2, ability_cooldown);
