hspeed *= slow_time;
vspd += grav;

y += vspd;

hspeed = clamp(hspeed,-5,5);