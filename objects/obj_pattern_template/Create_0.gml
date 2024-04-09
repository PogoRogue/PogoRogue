/// @description Initialize
// You can write your code in this editor

//The direction of the central projectile, 0=right,90=up,180=left,270=down
dir_central = 0;

//amount of projectile
amount = 3;
cur_amt = 0;
cur_angle = 0;

//amount of repeats and delay
repeats = 2;
cur_rep = 0;
delay = room_speed / 4;

//Spread of the projectile, and if they are random or not
spread = 60;
rand = false;

spd=3;
//sprite
sprite=spr_enemy_projectile;
gun_name="enemy_projectile";
if(cur_rep < repeats) {
	alarm_set(0, 1);
}
parent=noone;