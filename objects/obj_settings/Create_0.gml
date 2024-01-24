usable = true;
select = 1; //1 = passives, 2 = actives, 3 = weapons
select_max = 4; //max # of rows
select_x = 1; //passives only
select_x_max = 1; //number of columns
select_y = 0; //passives only
select_y_max = 0; //number of rows

selected_x = false;
selected_y = false;

with obj_pause {
	if pause = false {
		paused_outside = true;	
	}
}