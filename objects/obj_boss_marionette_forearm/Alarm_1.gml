/// @description Fire
// You can write your code in this editor
alarm_set(1,round(cooldown*3));

var _player_dir = point_direction(weapon_x, weapon_y, target.x, target.y+ 128);
switch(boss.weapon) {
	case BOSS3_WEAPONS.NONE:
		break;
	case BOSS3_WEAPONS.PISTOL:
		var _gun = instance_create_layer(weapon_x, weapon_y, "Instances", obj_boss_attack1);
		_gun.parent = self;
		_gun.dir_central = _player_dir;
		//scr_Screen_Shake(3.5,10,false);
		break;
	case BOSS3_WEAPONS.SHOTGUN:
		var _gun = instance_create_layer(weapon_x, weapon_y, "Instances", obj_boss_attack2);
		_gun.parent = self;
		_gun.dir_central = _player_dir;
		scr_Screen_Shake(6,15,false);
		break;
	case BOSS3_WEAPONS.MISSILE:
		var _gun = instance_create_layer(weapon_x, weapon_y, "Instances", obj_boss_attack3);
		_gun.parent = self;
		_gun.dir_central = _player_dir;
		scr_Screen_Shake(4,10,false);
		break;
	case BOSS3_WEAPONS.LASER:
		var _gun = instance_create_depth(weapon_x, weapon_y, depth - 100, obj_enemy_laser, {start_angle: _player_dir/* - (15 * sign(weapon_x - x))*/, end_angle: _player_dir /*- (15 * sign(weapon_x - x))/*_player_dir + (10 * sign(weapon_x - x))*/, duration: 1});
		_gun.parent = self;
		break;
}

show_debug_message("laser angle: " + string(_player_dir))

