/// @description initialize variables
//for final boss
boss_projectile=false;

sprite = spr_projectile_rocket;
spd = 0;                          
firerate_start = 1;               
firerate_end = 1;                 
firerate_mult = 0;               
firerate = 1;                     
destroy_on_impact = false;
screen_shake = {magnitude: 4, frames: 10};
destroy_time = 0;
flash_frame = 12;
grav_affected = false;
grv = obj_player.grv;
num_of_bounces = 0;
bounce_amount = 1;
damage = 16;
destroyable = true;

image_index = 0;
image_speed = 0;
image_angle = 90;
angle = image_angle;
hspd = lengthdir_x(spd,angle);
vspd = lengthdir_y(spd,angle);
max_num_of_bounces = num_of_bounces;
init_damage = damage;
sound = audio_play_sound(snd_nothing,0,false);
colliding_with_enemy = false;
gun_name = "Missile Launcher";

if destroy_time != 0 {
	alarm[0] = destroy_time;
}

//specific conditions

//missile
if (gun_name = "Missile Launcher") {
	//sound = audio_play_sound(snd_rocketwhoosh,0,false);
	temp_angle = image_angle;
	if collision_circle(x,y,160,obj_enemy_parent,false,true) != noone {
		if(!boss_projectile){
		    closest_enemy = instance_nearest(x,y,obj_enemy_parent);
		}else{
			closest_enemy = instance_nearest(x,y,obj_player);
		}
	}else {
		closest_enemy = noone;
	}
}

launched = false;
y_init = y;