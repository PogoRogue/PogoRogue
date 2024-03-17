/// @description Raise Shield
// You can write your code in this editor

if(action_cd == false)
{
	action_cd = true;

	sprite_index = spr_enemy_stomp_only_Shield;
	image_index = 0;

	alarm_set(1, 40);
	
	var _bullet = instance_create_layer(x, y, "Instances", obj_enemy_projectile_bullet);
	_bullet.speed=10;
	_bullet.direction=-other.direction;
	
}