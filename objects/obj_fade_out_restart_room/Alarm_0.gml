/// @description go to next room
room_restart();
if deactivate_all = true {
	instance_deactivate_all(false);	
}
global.room_width = 768;
global.room_height = 432;
camera_set_view_size(view_camera[0],global.room_width,global.room_height);