if instance_number(obj_settings) > 1 {
	instance_destroy();
}

usable = true;
select = 1; //1 = passives, 2 = actives, 3 = weapons
select_max = 4; //max # of rows
select_x = 1; //passives only
select_x_max = 1; //number of columns
select_y = 0;
select_y_max = 0; //number of rows

selected_x = false;
selected_y = false;

with obj_pause {
	if pause = false {
		paused_outside = true;	
	}
}

//lists
option_1_y = 160;
item_height = 32;
list_slider_str = "test";
alarm2_time = 30;

scr_Settings_Audio();
scr_Settings_Video();
scr_Settings_Gameplay();