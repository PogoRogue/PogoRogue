/// @description Randomly replace chests with other types

if (destroy <= destroy_chance and object_get_name(object_index) = "obj_chest") { 
	instance_destroy();
}else {
	new_chest = choose(obj_chest,obj_chest,obj_chest,obj_chest,obj_chest_coin,obj_chest_coin,obj_chest_weapon,obj_chest_active);

	if new_chest != obj_chest and object_get_name(object_index) = "obj_chest" {
		instance_destroy();
		instance_create_depth(x,y,depth,new_chest);
	}
}

random_items = scr_Random_Item_Drops();