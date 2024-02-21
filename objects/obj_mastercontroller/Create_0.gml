if !instance_exists(obj_saveload) {
	instance_create_depth(x,y,depth,obj_saveload);
}
if !instance_exists(obj_controls_controller) {
	instance_create_depth(x,y,depth,obj_controls_controller);
}
if !instance_exists(obj_controls_keyboard) {
	instance_create_depth(x,y,depth,obj_controls_keyboard);
}
if !instance_exists(obj_sound_controller) {
	instance_create_depth(x,y,depth,obj_sound_controller);
}