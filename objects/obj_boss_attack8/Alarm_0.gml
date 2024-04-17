/// @description Fire
// You can write your code in this editor

cur_amt = 0;
cur_angle = 0;

while(cur_amt < amount) {
	var _bullet = instance_create_depth(x, y, self.depth, obj_enemy_projectile_bullet);
	
	//manually set variables of the bullet here
	_bullet.speed = 1;
	_bullet.lifetime=room_speed;
    _bullet.bounce=true;
	_bullet.sprite_index=spr_projectile_grenade;
	_bullet.grav=gravity;
	_bullet.explode=true;
	_bullet.bounce_mod=0.5;
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

