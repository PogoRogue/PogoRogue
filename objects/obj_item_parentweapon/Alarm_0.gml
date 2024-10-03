/// @description create item
with instance_create_depth(x,y,obj_player.depth-2,random_weapon_drop,{slot_machine: slot_machine}) {
	follow_player = true;
	slot_machine = slot_machine;
}

instance_destroy();
show_debug_message("weapon destroyed! 2 " + string(object_get_name(object_index)));