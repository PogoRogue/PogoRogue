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
if !instance_exists(obj_phase) {
	instance_create_depth(x,y,depth,obj_phase);
}

if room = room_boss_3 {
	global.ground_layer = layer_create(150);
	global.tilemap_ground = layer_tilemap_create(global.ground_layer,-20000,-20000,global.tileset,20000,20000);	
}