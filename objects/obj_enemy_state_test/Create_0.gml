/// @description Invinsible while flying
// Inherit the parent event
event_inherited();

spd = 1;
image_xscale = spd;
hp = 3; 
hp_max = hp;
hp_percent = (hp / hp_max) * 100;
alarm_set(1, room_speed*4);