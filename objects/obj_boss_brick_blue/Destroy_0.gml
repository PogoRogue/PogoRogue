/// @description Spawn enemy
// You can write your code in this editor

if explode = false {
	instance_create_layer(x, y, "enemies", obj_subboss_shield, {parent});
}


// Inherit the parent event
event_inherited();

