/// @description Perform current ability
// You can write your code in this editor

switch(ability) {
	case BOSS3_ABILITIES.GROUND_POUND:
		spring_force = 150;
		oscillation = 0;
		break;
	case BOSS3_ABILITIES.GROUND_POUND_SHOCKWAVE:
		spring_force = 150;
		oscillation = 0;
		alarm_set(3, room_speed / 4);
		break;
	case BOSS3_ABILITIES.BULLET_BLAST:
		var _burst = instance_create_layer(x, y, "Instances", obj_pattern_template);
		_burst.parent = self;
		_burst.spread = 360;
		_burst.repeats = 0;
		_burst.amount = 18;
		break;
	case BOSS3_ABILITIES.SHIELD:
		if(!instance_exists(obj_shield_plus)) {
			var _shield = instance_create_layer(x, y, "Instances", obj_shield_plus);
			_shield.parent = self;
			_shield.depth = depth + 1;
		}
		break;
}

alarm_set(2, ability_cooldown);
