/// @description Change movement
// You can write your code in this editor
//handles gravity
vspeed=vspeed+grav;
//handle homing
dist_to_player = distance_to_object(player);
if(homing&&dist_to_player<hm_range){
	if(speed<max_spd){
		if(x>player.x){
			hspeed-=hm_spd;
		}
		if(x<player.x){
			hspeed+=hm_spd;
		}
		if(y>player.y){
			vspeed-=hm_spd;
		}
		if(y<player.y){
			vspeed+=hm_spd;
		}
	}else{
		speed=speed*0.9;
	}
}
//handles acceleration
vspeed=vspeed*accel;
hspeed=hspeed*accel;

if(boom&&distance_to_point(og_x,og_y)>return_range){
	if(speed<max_spd){
		if(x>og_x){
			hspeed-=hm_spd;
		}
		if(x<og_x){
			hspeed+=hm_spd;
		}
		if(y>og_y){
			vspeed-=hm_spd;
		}
		if(y<og_y){
			vspeed+=hm_spd;
		}
	}else{
		speed=speed*0.9;
	}
}
if(sprite_index!=spr_enemy_projectile){
	image_angle = point_direction (x,y, x+hspeed,y+vspeed);
}