/// @description Insert description here
// You can write your code in this editor




//////
parent = noone;
is_active = true;
restore_duration = 2.5 * room_speed;
lifetime=5*room_speed;
alarm_set(1,lifetime);
boss=instance_nearest(x,y,obj_boss_marionette);
if(boss.phase==2){
	image_index=spr_shieldbubble_BOSS2;
}
image_speed=0;