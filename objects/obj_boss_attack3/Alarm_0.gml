/// @description Repeat fires
// You can write your code in this editor

cur_amt = 0;
cur_angle = 0;

while(cur_amt < amount) {
	var _bullet = instance_create_depth(x, y, self.depth, obj_enemy_projectile_missile);
	
	// manually set variables of the bullet here
	_bullet.speed = 3;
	_bullet.homing=true;
	_bullet.hm_spd=0.2;
	_bullet.max_spd=7.5;
	_bullet.lifetime=2*room_speed;
	_bullet.hm_range=250;
	_bullet.explode=true;
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

audio_play_sound(snd_rocketwhoosh_enemy,0,false);