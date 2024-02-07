/// @description Change movement
// You can write your code in this editor
//handles gravity
vspeed=vspeed+grav;
//handle homing
if(homing){
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
	}
}
//handles acceleration
vspeed=vspeed*accel;
hspeed=hspeed*accel;

