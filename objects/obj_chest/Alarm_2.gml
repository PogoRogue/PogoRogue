/// @description Randomly replace chests with other types
random_set_seed(global.seed+global.chest_number);
destroy = irandom_range(1,100);
if object_get_name(object_index) = "obj_chest" { //dont move special chests
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

if room != room_tutorial {
if (destroy <= destroy_chance and object_get_name(object_index) = "obj_chest") { 
	instance_destroy();
}else {
	new_chest = choose(obj_chest,obj_chest,obj_chest,obj_chest,obj_chest_coin,obj_chest_coin,obj_chest_weapon,obj_chest_active);

	// For one in 30 chests, create a jack in the box
	if(irandom(29) == 0) {
		switch(new_chest) {
			case obj_chest_coin:
				new_chest = obj_enemy_jack_coin;
				break;
			case obj_chest_weapon:
				new_chest = obj_enemy_jack_weapon;
				break;
			case obj_chest_active:
				new_chest = obj_enemy_jack_active;
				break;
			default:
				new_chest = obj_enemy_jack;
		}
	}
	
	if new_chest != obj_chest and object_get_name(object_index) = "obj_chest" {
		instance_destroy();
		instance_create_depth(x,y,depth,new_chest);
	}
}
}

random_items = scr_Random_Item_Drops();

random_set_seed(global.seed);