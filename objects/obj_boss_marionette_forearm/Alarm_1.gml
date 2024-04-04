/// @description Fire
// You can write your code in this editor
weapon=1;
//weapon=random(8);
_xx = x + lengthdir_x(48, image_angle);
_yy = y + lengthdir_y(48, image_angle);

if(weapon<=1){
	var _gun = instance_create_layer(_xx, _yy, "Instances", obj_boss_attack1);
	_gun.parent=self;
	_gun.dir_central=point_direction(_xx,_yy,target.x,target.y);
}else if(weapon<=2){
	var _gun = instance_create_layer(_xx, _yy, "Instances", obj_boss_attack2);
	_gun.parent=self;
}else if(weapon<=3){
	var _gun = instance_create_layer(_xx, _yy, "Instances", obj_boss_attack3);
	_gun.parent=self;
}else if(weapon<=4){
	var _gun = instance_create_layer(_xx, _yy, "Instances", obj_boss_attack4);
	_gun.parent=self;
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
alarm_set(1,cooldown);