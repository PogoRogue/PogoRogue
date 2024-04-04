/// @description create item
with instance_create_depth(x,y,obj_player.depth-2,random_weapon_drop) {
	follow_player = true;
}

instance_destroy();
show_debug_message("weapon destroyed! 2 " + string(object_get_name(object_index)));