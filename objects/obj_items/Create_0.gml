usable = true;
select = 1; //1 = passives, 2 = actives, 3 = weapons
select_max = 3; //max # of rows
select_x = 1; //passives only
select_x_max = 4; //number of columns
select_y = 0; //passives only
select_y_max = 5; //number of rows
page_num = 1; //page number for passives
actives_swap = false;
weapons_swap = false;
weapons_swap1 = false;
weapons_swap2 = false;

selected_x = false;
selected_y = false;

alarm2_time = 30;
alarm3_time = 30;

with obj_pause {
	if pause = false {
		paused_outside = true;	
	}
}

instance_activate_object(obj_player);
with obj_player {
	//weapons
	other.gun_1 = gun_1;
	other.gun_2 = gun_2;
	other.gun_3 = gun_3;
	other.num_of_weapons = weapons_equipped;
	if num_of_weapons = 0 { 
		other.num_of_weapons = 0;
	}
	//pickups
	other.pickup_1 = pickup_1;
	other.pickup_2 = pickup_2;
	other.num_of_pickups = num_of_pickups;
}
if instance_exists(obj_pausemenu) {
	instance_deactivate_object(obj_player);
}