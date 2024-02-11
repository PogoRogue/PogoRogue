/// @description Repeat fires
// You can write your code in this editor
cur_amt = 0;
cur_angle=0;
while(cur_amt<amount){
	var _bullet=instance_create_layer(x,y,"Instances",obj_enemy_projectile_bullet);
	
	//manually set variables of the bullet here
	_bullet.speed=3;
	_bullet.grav=.03;
	
	if(rand){
		_bullet.direction=dir_central+random_range(-spread/2,spread/2);
	}
	else{
		_bullet.direction=dir_central-spread/2+cur_angle;
		cur_angle+=spread/(amount-1)
	}
	player = instance_nearest(x, y, obj_player);
	time=sqrt(abs(player.x-x)^2+abs(player.y-y)^2)/3;
	cur_angle+=spread/(amount-1);
	//upward adjustment
	player = instance_nearest(x, y, obj_player);
	time=sqrt(abs(player.x-x)^2+abs(player.y-y)^2)/3;
	down_spd=time*0.03;
	_bullet.vspeed-=down_spd*4;
	cur_amt++;
}
cur_rep++;
if(cur_rep<repeats){
	alarm_set(0,delay);
}else{
	instance_destroy(self);
}
