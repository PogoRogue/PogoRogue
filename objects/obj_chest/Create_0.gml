/// @description create collision walls

//randomize();
random_set_seed(global.seed+global.chest_number);
open = false;
colliding = false; //is the player currently colliding with the chest
create_coins = false;
num_of_coins = irandom_range(min_num_of_coins,max_num_of_coins); //created in variable definitions tab
coins_increased = false;
allow_projectile_collision = false;
image_index = 0;
image_speed = 0;
mask_index = spr_treasurechest_new_mask;

//drop chances
heart_chance = 50 - global.luck;
buff_chance = 90 - global.luck;
weapon_chance = 60 + global.luck;
pickup_chance = 60 + global.luck;
destroy_chance = 0; //when active, change to ~80

created_items = false;

if object_get_name(object_index) = "obj_chest" { //dont move special chests
	if !position_meeting(bbox_left+1,y+33,obj_ground_parent) and !position_meeting(bbox_left+1,y+33,obj_ground_oneway) {
		x += 16;
	}else if !position_meeting(bbox_right-1,y+33,obj_ground_parent) and !position_meeting(bbox_right-1,y+33,obj_ground_oneway) {
		x -= 16;	
	}
}

destroy = irandom_range(1,100);

if (destroy <= destroy_chance and object_get_name(object_index) = "obj_chest") { 
	instance_destroy();
}else {
	new_chest = choose(obj_chest,obj_chest,obj_chest,obj_chest,obj_chest,obj_chest_coin,obj_chest_coin,obj_chest_weapon,obj_chest_active);

	if new_chest != obj_chest and object_get_name(object_index) = "obj_chest" {
		instance_destroy();
		instance_create_depth(x,y,depth,new_chest);
	}
}

random_items = scr_Random_Item_Drops();

var test = 0;
global.chest_number += 1;
random_set_seed(global.seed);