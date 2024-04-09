/// @description boomerange
// You can write your code in this editor

//The direction of the central projectile, 0=right,90=up,180=left,270=down
dir_central = 0;

//amount of projectile
amount = 1;
cur_amt = 0;
cur_angle = 0;

//amount of repeats and delay
repeats = 1;
cur_rep = 0;
delay = room_speed / 4;

//Spread of the projectile, and if they are random or not
spread = 0;
rand = false;

spd=3;
//sprite
sprite=spr_projectile_yoyo;

if(cur_rep < repeats) {
	alarm_set(0, 1);
}