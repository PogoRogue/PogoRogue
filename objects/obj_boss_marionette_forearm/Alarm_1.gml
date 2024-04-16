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
	case BOSS3_WEAPONS.BOUNCY:
		var _gun = instance_create_layer(weapon_x, weapon_y, "Instances", obj_boss_attack4);
		_gun.parent = self;
		_gun.dir_central = point_direction(weapon_x, weapon_y, target.x, target.y);
		break;
	case BOSS3_WEAPONS.JAVALIN:
		var _gun = instance_create_layer(weapon_x, weapon_y, "Instances", obj_boss_attack5);
		_gun.parent = self;
		_gun.dir_central = point_direction(weapon_x, weapon_y, target.x, target.y);
		break;
	case BOSS3_WEAPONS.BUBBLE:
		var _gun = instance_create_layer(weapon_x, weapon_y, "Instances", obj_boss_attack6);
		_gun.parent = self;
		_gun.dir_central = point_direction(weapon_x, weapon_y, target.x, target.y);
		break;
	case BOSS3_WEAPONS.BOOMERANG:
		var _gun = instance_create_layer(weapon_x, weapon_y, "Instances", obj_boss_attack7);
		_gun.parent = self;
		_gun.dir_central = point_direction(weapon_x, weapon_y, target.x, target.y);
		break;
	case BOSS3_WEAPONS.GRENADE:
		var _gun = instance_create_layer(weapon_x, weapon_y, "Instances", obj_boss_attack8);
		_gun.parent = self;
		_gun.dir_central = point_direction(weapon_x, weapon_y, target.x, target.y);
		break;
}


/*
	//Pistol implemented
	if(weapon<=1){
		var _gun = instance_create_layer(_xx, _yy, "Instances", obj_boss_attack1);
		_gun.parent=self;
		_gun.dir_central=point_direction(_xx,_yy,target.x,target.y);
	}else if(weapon<=2){
		//shotgun implmented
		var _gun = instance_create_layer(_xx, _yy, "Instances", obj_boss_attack2);
		_gun.parent=self;
		_gun.dir_central=point_direction(_xx,_yy,target.x,target.y);
	}else if(weapon<=3){
		//missle
		var _gun = instance_create_layer(_xx, _yy, "Instances", obj_boss_attack3);
		_gun.parent=self;
	    _gun.dir_central=point_direction(_xx,_yy,target.x,target.y);
	}

	else if(weapon<=4){
		var _gun = instance_create_layer(_xx, _yy, "Instances", obj_boss_attack5);
		_gun.parent=self;
		_gun.dir_central=point_direction(_xx,_yy,target.x,target.y);
	}else if(weapon<=5){
		var _gun = instance_create_layer(_xx, _yy, "Instances", obj_boss_attack5);
		_gun.parent=self;

	}else if(weapon<=6){
		var _gun = instance_create_layer(_xx, _yy, "Instances", obj_boss_attack6);
		_gun.parent=self;
	}else if(weapon<=7){
		var _gun = instance_create_layer(_xx, _yy, "Instances", obj_boss_attack7);
		_gun.parent=self;
	}else if(weapon<=8){
		var _gun = instance_create_layer(_xx, _yy, "Instances", obj_boss_attack8);
		_gun.parent=self; 
	}
	*/

alarm_set(1,cooldown);
