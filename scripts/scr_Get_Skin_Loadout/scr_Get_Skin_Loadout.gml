// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Get_Skin_Loadout(){
	if global.current_skin = 2 {
		num_of_weapons = 1;
		gun_1 = yoyo_gun;
		gun_2 = gun_1;
		gun_3 = gun_1;
		gun_array = [gun_1,gun_2,gun_3];
			
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
		num_of_weapons = 1;
		gun_1 = default_gun;
		gun_2 = gun_1;
		gun_3 = gun_1;
		gun_array = [gun_1,gun_2,gun_3];
			
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
			
		num_of_pickups = 1;
		pickup_1 = pickup_jetpack;
		pickup_2 = pickup_nothing;
		pickups_array = [pickup_1,pickup_2];
		
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
			
		num_of_pickups = 2;
		pickup_1 = pickup_reload;
		pickup_2 = pickup_parachute;
		pickups_array = [pickup_1,pickup_2];
		
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
			
		num_of_pickups = 0;
		pickup_1 = pickup_nothing;
		pickup_2 = pickup_nothing;
		pickups_array = [pickup_1,pickup_2];
		
		// Stats
		hp = 32;
		max_hp = 32; //4 hearts
		max_max_hp = 80; //10 hearts
		armor_buff = 0;
		max_armor_buff = 5;
	}else {
		num_of_weapons = 1;
		gun_1 = default_gun;
		gun_2 = gun_1;
		gun_3 = gun_1;
		gun_array = [gun_1,gun_2,gun_3];
			
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