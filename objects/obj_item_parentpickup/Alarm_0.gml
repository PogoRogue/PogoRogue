/// @description create item
with instance_create_depth(x,y+8,obj_player.depth-2,random_pickup_drop, {slot_machine: slot_machine}) {
	follow_player = true;
	slot_machine = other.slot_machine;
}
instance_destroy();