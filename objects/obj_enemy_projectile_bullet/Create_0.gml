/// @description Chnage basic functionalities here
// You can write your code in this editor



// Inherit the parent event
event_inherited();
player = instance_nearest(x, y, obj_player);
//if affected by gravity, make this positive
grav=0;
//if explode, make this true
explode=false;
//if accelerate/deaccelerate, b=make this greater/lower than one
accel=1;
//if homing, make this to true and change hm_spd and max_spd
homing=false;
hm_spd=0;
max_spd=0;
//If bounce, change the bounce, lifetime, and add the alarm
bounce=false;
lifetime=0;
//alarm_set(0,lifetime);