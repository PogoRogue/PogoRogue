/// @description Randomly replace chests with other types
random_set_seed(global.seed+global.chest_number);

if object_get_name(object_index) = "obj_chest_combat" { //dont move special chests
	while !position_meeting(bbox_left+1,y+33,obj_ground_parent) and !position_meeting(bbox_left+1,y+33,obj_ground_oneway) {
		x += 16;
	}
	while !position_meeting(bbox_right-1,y+33,obj_ground_parent) and !position_meeting(bbox_right-1,y+33,obj_ground_oneway) {
		x -= 16;	
	}
	while position_meeting(bbox_left+1,y,obj_ground) {
		x += 16;	
	}
	while position_meeting(bbox_right-2,y,obj_ground) {
		x -= 16;	
	}
}

global.chest_number += 1;

if (destroy <= destroy_chance and object_get_name(object_index) = "obj_chest_combat") { 
	instance_destroy();
}else {
	new_chest = choose(obj_chest,obj_chest,obj_chest,obj_chest,obj_chest_coin,obj_chest_coin,obj_chest_weapon,obj_chest_active);

	if new_chest != obj_chest and object_get_name(object_index) = "obj_chest_combat" {
		instance_destroy();
		with instance_create_depth(x,y,depth,new_chest) {
			destroy_chance = 0;
		}
	}
}

random_items = scr_Random_Item_Drops();

random_set_seed(global.seed);