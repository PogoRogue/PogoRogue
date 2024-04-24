/// @description Spawn enemy
// You can write your code in this editor


var inst = instance_create_layer(x, y, "enemies", obj_subboss_fly_chasing);
inst.proc_gen_tag = proc_gen_tag;

// Inherit the parent event
event_inherited();

