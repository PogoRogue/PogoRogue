/// @description Fire
// You can write your code in this editor

switch(boss.weapon) {
	case BOSS3_WEAPONS.NONE:
		break;
	case BOSS3_WEAPONS.PISTOL:
		var _gun = instance_create_layer(weapon_x, weapon_y, "Instances", obj_boss_attack1);
		_gun.parent = self;
		_gun.dir_central = point_direction(weapon_x, weapon_y, target.x, target.y);
		break;
	case BOSS3_WEAPONS.SHOTGUN:
		var _gun = instance_create_layer(weapon_x, weapon_y, "Instances", obj_boss_attack2);
		_gun.parent = self;
		_gun.dir_central = point_direction(weapon_x, weapon_y, target.x, target.y);
		break;
	case BOSS3_WEAPONS.MISSILE:
		var _gun = instance_create_layer(weapon_x, weapon_y, "Instances", obj_boss_attack3);
		_gun.parent = self;
		_gun.dir_central = point_direction(weapon_x, weapon_y, target.x, target.y);
		break;
	case BOSS3_WEAPONS.LASER:
		var _gun = instance_create_layer(weapon_x, weapon_y, "Instances", obj_boss_attack4);
		_gun.parent = self;
		_gun.dir_central = point_direction(weapon_x, weapon_y, target.x, target.y);
		break;
}

alarm_set(1,cooldown);
