/// @description Create shockwave
// You can write your code in this editor

var _shock1 = instance_create_layer(x, y - 100, "Instances", obj_shockwave);
var _shock2 = instance_create_layer(x, y - 100, "Instances", obj_shockwave);

_shock2.image_xscale = -1;
_shock1.hspeed = -4;
_shock2.hspeed = 4;

audio_play_sound(snd_groundpound_enemy,0,false);