/// @description Initialize
// You can write your code in this editor

//The direction of the central projectile, 0=right,90=up,180=left,270=down
dir_central = 90;

//amount of projectile
amount = 1;
cur_amt = 0;
cur_angle = 0;

//amount of repeats and delay
repeats = 3;
cur_rep = 0;
delay = room_speed / 4;

//Spread of the projectile, and if they are random or not
spread = 60;
rand = true;

if(cur_rep < repeats) {
	alarm_set(0, 1);
}