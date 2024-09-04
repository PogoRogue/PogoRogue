/// @description Insert description here
// You can write your code in this editor

if distance_to_object(target_obj) < 64 {
	// Inherit the parent event
	event_inherited();
	instance_destroy(target_obj);	
}