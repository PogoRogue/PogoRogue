// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Get_Skin_Loadout(){
	if global.current_skin = 0 {
		num_of_weapons = 2;
		gun_1 = paintball_gun;
		gun_2 = default_gun;
		gun_3 = gun_1;
		gun_array = [gun_1,gun_2,gun_3];
		
		var temp_item = instance_create_depth(0,0,depth,obj_item_weapon_paintball);
		global.all_weapon_costs[0] = obj_item_weapon_paintball.item_cost;
		instance_destroy(temp_item);
		
		global.all_weapon_costs[1] = 25;
			
		num_of_pickups = 0;
		pickup_1 = pickup_nothing;
		pickup_2 = pickup_nothing;
		pickups_array = [pickup_1,pickup_2]
		
		// Stats
		hp = 40;
		max_hp = 40; //4 hearts
		max_max_hp = 80; //10 hearts
		armor_buff = 0;
		max_armor_buff = 5;
	}else if global.current_skin = 1 {
		num_of_weapons = 1;
		gun_1 = javelin_gun;
		gun_2 = gun_1;
		gun_3 = gun_1;
		gun_array = [gun_1,gun_2,gun_3];
		
		var temp_item = instance_create_depth(0,0,depth,obj_item_weapon_javelins);
		global.all_weapon_costs[0] = obj_item_weapon_javelins.item_cost;
		instance_destroy(temp_item);
		
		num_of_pickups = 1;
		pickup_1 = pickup_tripleshot;
		pickup_2 = pickup_nothing;
		pickups_array = [pickup_1,pickup_2];
		
		var temp_item2 = instance_create_depth(0,0,depth,obj_item_pickup_tripleshot);
		global.all_pickup_costs[0] = obj_item_pickup_tripleshot.item_cost;
		instance_destroy(temp_item2);
		
		// Stats
		hp = 48;
		max_hp = 48; //5 hearts
		max_max_hp = 80; //10 hearts
		armor_buff = 0;
		max_armor_buff = 5;
	}else if global.current_skin = 2 {
		num_of_weapons = 1;
		gun_1 = yoyo_gun;
		gun_2 = gun_1;
		gun_3 = gun_1;
		gun_array = [gun_1,gun_2,gun_3];
		
		var temp_item = instance_create_depth(0,0,depth,obj_item_weapon_yoyo);
		global.all_weapon_costs[0] = obj_item_weapon_yoyo.item_cost;
		instance_destroy(temp_item);
		
		num_of_pickups = 0;
		pickup_1 = pickup_nothing;
		pickup_2 = pickup_nothing;
		pickups_array = [pickup_1,pickup_2];
		
		// Stats
		hp = 40;
		max_hp = 40; //5 hearts
		max_max_hp = 80; //10 hearts
		armor_buff = 4;
		max_armor_buff = 5;
	}else if global.current_skin = 3 {
		num_of_weapons = 2;
		gun_1 = boomerang_gun;
		gun_2 = default_gun;
		gun_3 = gun_1;
		gun_array = [gun_1,gun_2,gun_3];
		
		var temp_item = instance_create_depth(0,0,depth,obj_item_weapon_boomerang);
		global.all_weapon_costs[0] = obj_item_weapon_boomerang.item_cost;
		instance_destroy(temp_item);
		
		global.all_weapon_costs[1] = 25;
			
		num_of_pickups = 0;
		pickup_1 = pickup_nothing;
		pickup_2 = pickup_nothing;
		pickups_array = [pickup_1,pickup_2]
		
		// Stats
		hp = 32;
		max_hp = 32; //4 hearts
		max_max_hp = 80; //10 hearts
		armor_buff = 0;
		max_armor_buff = 5;
	}else if global.current_skin = 4 {
		num_of_weapons = 1;
		gun_1 = burstfire_gun;
		gun_2 = gun_1;
		gun_3 = gun_1;
		gun_array = [gun_1,gun_2,gun_3];
		
		var temp_item = instance_create_depth(0,0,depth,obj_item_weapon_burstfire);
		global.all_weapon_costs[0] = obj_item_weapon_burstfire.item_cost;
		instance_destroy(temp_item);
			
		num_of_pickups = 1;
		pickup_1 = pickup_jetpack;
		pickup_2 = pickup_nothing;
		pickups_array = [pickup_1,pickup_2];
		
		var temp_item2 = instance_create_depth(0,0,depth,obj_item_pickup_jetpack);
		global.all_pickup_costs[0] = obj_item_pickup_jetpack.item_cost;
		instance_destroy(temp_item2);
		
		// Stats
		hp = 24;
		max_hp = 24; //3 hearts
		max_max_hp = 80; //10 hearts
		armor_buff = 3;
		max_armor_buff = 5;
	}else if global.current_skin = 5 {
		num_of_weapons = 1;
		gun_1 = sixshooter_gun;
		gun_2 = gun_1;
		gun_3 = gun_1;
		gun_array = [gun_1,gun_2,gun_3]
		
		var temp_item = instance_create_depth(0,0,depth,obj_item_weapon_sixshooter);
		global.all_weapon_costs[0] = obj_item_weapon_sixshooter.item_cost;
		instance_destroy(temp_item);
			
		num_of_pickups = 2;
		pickup_1 = pickup_reload;
		pickup_2 = pickup_parachute;
		pickups_array = [pickup_1,pickup_2];
		
		var temp_item2 = instance_create_depth(0,0,depth,obj_item_pickup_reload);
		global.all_pickup_costs[0] = obj_item_pickup_reload.item_cost;
		instance_destroy(temp_item2);
		
		var temp_item3 = instance_create_depth(0,0,depth,obj_item_pickup_parachute);
		global.all_pickup_costs[1] = obj_item_pickup_parachute.item_cost;
		instance_destroy(temp_item3);
		
		// Stats
		hp = 32;
		max_hp = 32; //4 hearts
		max_max_hp = 80; //10 hearts
		armor_buff = 1;
		max_armor_buff = 5;
	}else if global.current_skin = 6 {
		num_of_weapons = 1;
		gun_1 = puncher_gun;
		gun_2 = gun_1;
		gun_3 = gun_1;
		gun_array = [gun_1,gun_2,gun_3];
		
		var temp_item = instance_create_depth(0,0,depth,obj_item_weapon_puncher);
		global.all_weapon_costs[0] = obj_item_weapon_puncher.item_cost;
		instance_destroy(temp_item);
			
		num_of_pickups = 1;
		pickup_1 = pickup_hatgun;
		pickup_2 = pickup_nothing;
		pickups_array = [pickup_1,pickup_2];
		
		var temp_item2 = instance_create_depth(0,0,depth,obj_item_pickup_hatgun);
		global.all_pickup_costs[0] = obj_item_pickup_hatgun.item_cost;
		instance_destroy(temp_item2);
		
		// Stats
		hp = 32;
		max_hp = 32; //4 hearts
		max_max_hp = 80; //10 hearts
		armor_buff = 0;
		max_armor_buff = 5;
	}else {
		num_of_weapons = 2;
		gun_1 = paintball_gun;
		gun_2 = default_gun;
		gun_3 = gun_1;
		gun_array = [gun_1,gun_2,gun_3];
		
		global.all_weapon_costs[0] = 0;
			
		num_of_pickups = 0;
		pickup_1 = pickup_nothing;
		pickup_2 = pickup_nothing;
		pickups_array = [pickup_1,pickup_2];
		
		// Stats
		hp = 40;
		max_hp = 40; //5 hearts
		max_max_hp = 80; //10 hearts
		armor_buff = 0;
		max_armor_buff = 5;
	}
	
	current_gun = 0;
	gun = gun_array[current_gun];
}