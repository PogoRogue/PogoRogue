/// @description Insert description here
// You can write your code in this editor
if room != room_shop and created_in_room = false {
	instance_destroy();
	show_debug_message("weapon destroyed! 4 " + string(object_get_name(object_index)));
}