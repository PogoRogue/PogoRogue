/// @description Fire
// You can write your code in this editor


var _player_dir = point_direction(weapon_x, weapon_y, target.x, target.y);
switch(boss.weapon) {
	case BOSS3_WEAPONS.NONE:
		break;
	case BOSS3_WEAPONS.PISTOL:
		var _gun = instance_create_layer(weapon_x, weapon_y, "Instances", obj_boss_attack1);
		_gun.parent = self;
		_gun.dir_central = _player_dir;
		break;
	case BOSS3_WEAPONS.SHOTGUN:
		var _gun = instance_create_layer(weapon_x, weapon_y, "Instances", obj_boss_attack2);
		_gun.parent = self;
		_gun.dir_central = _player_dir;
		break;
	case BOSS3_WEAPONS.MISSILE:
		var _gun = instance_create_layer(weapon_x, weapon_y, "Instances", obj_boss_attack3);
		_gun.parent = self;
		_gun.dir_central = _player_dir;
		break;
	case BOSS3_WEAPONS.LASER:
		var _gun = instance_create_depth(weapon_x, weapon_y, depth - 5, obj_enemy_laser, {start_angle: _player_dir - (15 * sign(weapon_x - x)), end_angle: _player_dir + (10 * sign(weapon_x - x)), duration: 0.5});
		_gun.parent = self;
		break;
}

alarm_set(1,cooldown);
