/// @description Insert description here
// You can write your code in this editor
/// @description Repeat fires
// You can write your code in this editor

cur_amt = 0;
cur_angle = 0;

while(cur_amt < amount) {
	var _bullet = instance_create_depth(x, y, self.depth, obj_enemy_projectile_bullet);
	
	//manually set variables of the bullet here
	_bullet.speed = spd;
	_bullet.lifetime=25;
	_bullet.sprite_index=sprite;
	_bullet.collide_with_walls = false;
	if(rand) {
		_bullet.direction = dir_central + random_range(-spread / 2, spread / 2);
	} else {
		_bullet.direction = dir_central-spread / 2 + cur_angle;
		cur_angle += spread / (amount-1);
	}
	
	cur_amt++;
}

cur_rep++;

if(cur_rep < repeats){
	alarm_set(0, delay);
}else{
	instance_destroy(self);
}
