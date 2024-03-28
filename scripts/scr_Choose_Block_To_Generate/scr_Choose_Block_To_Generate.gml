///@desc Given a proc gen layout grid, and a location in it, decides what kind of block needs to go there
///@returns number corresponding to sprite to build, 0 corresponding to player start, or -1 for generate nothing
function scr_Choose_Block_To_Generate(layout_grid, grid_x, grid_y){
	var room_string = ds_grid_get(layout_grid, grid_x, grid_y);
	
	//Set to a 3x3 room
	if(room_string == "c3c" || room_string == "c2c")
	{
		return Get_Combat_Room(room_string);
	}
	else if(room_string == "Tc") //Marks the player starting room!
	{
		return spr_start;//spr_3x3_Starting_Room;
	}	
	else if(room_string == "Shc") //Shop Room
	{
		switch (global.phase) {
			case 1:
				return spr_1x1_Shop_Hallway_Phase1;
			case 2:
				return spr_1x1_Shop_Hallway_Phase2;
			case 3:
				return spr_1x1_Shop_Hallway_Phase3;
		}
	}
	else if(room_string == "Bc") //Boss Teleport Room
	{
		switch (global.phase) {
			case 1:
				return spr_1x1_boss_portal_Phase1;
			case 2:
				return spr_1x1_boss_portal_Phase2;
			case 3:
				return spr_1x1_boss_portal_Phase3;
		}
	}
	else if(room_string == "s") //s marks the player start! (In case the first room doesn't
	{
		return 0;
	}
	else if(room_string == "1hc" || room_string == "1hcf") //Marks the corner of a horizontal length 2 hallway chunk
	{
		switch (global.phase) {
			case 1:
				return spr_lr_length2_Phase1;
			case 2:
				return spr_lr_length2_Phase2;
			case 3:
				return spr_lr_length2_Phase3;
		}
	}
	else if(room_string == "1vc" || room_string == "1vcf") //Marks the corner of a vertical length 2 hallway chunk
	{
		switch (global.phase) {
			case 1:
				return spr_ud_length2_Phase1;
			case 2:
				return spr_ud_length2_Phase2;
			case 3:
				return spr_ud_length2_Phase3;
		}
	}
	else if(room_string == "1" || room_string == "1f") //Decide what proc gen block to use
	{
		var hallway_type_string = Choose_Hallway_Type_To_Generate(layout_grid, grid_x, grid_y);
		switch(hallway_type_string)
		{
			case "ul":
				return Get_UL_Hallway();
			case "ud":
				return Get_UD_Hallway();
			case "dr":
				return Get_DR_Hallway();
			case "lr":
				return Get_LR_Hallway();
		}
	}
	return -1; //No current valid block for the conditions
}

function Choose_Hallway_Type_To_Generate(layout_grid, grid_x, grid_y) {
		//Get all neighboring blocks
		var up_val = ds_grid_get(layout_grid, grid_x, grid_y +1);
		var down_val = ds_grid_get(layout_grid, grid_x, grid_y-1);
		var left_val = ds_grid_get(layout_grid, grid_x-1, grid_y);
		var right_val = ds_grid_get(layout_grid, grid_x+1, grid_y);
		
		var total_adjacent_proc_gen = 0;
		if(string_count("1", up_val) > 0)
			total_adjacent_proc_gen++;
		if(string_count("1", down_val) > 0)
			total_adjacent_proc_gen++;
		if(string_count("1", left_val) > 0)
			total_adjacent_proc_gen++;
		if(string_count("1", right_val) > 0)
			total_adjacent_proc_gen++;
			
		if(total_adjacent_proc_gen == 1) //This is the case that we must be connected to a combat room
		{
			if(string_count("1", up_val) > 0) //Proc gen above us
			{
				if(down_val != "w")
				{
					//Combat room below
					return "ud";
				}
				else if(left_val != "w")
				{
					//Combat room left
					return "ul";
				}
				else if(right_val != "w")
				{
					//Combat room right
					return "ul"; //Mirrored
				}
			}
			else if(string_count("1", down_val) > 0) //Proc gen block below
			{
				if(up_val != "w")
				{
					//Combat room above
					return "ud";
				}
				else if(left_val != "w")
				{
					//Combat room left
					return "dr"; //Mirrored
				}
				else if(right_val != "w")
				{
					//Combat room right
					return "dr";
				}
			}
			else if(string_count("1", left_val) > 0) //Proc gen block left
			{
				if(up_val != "w")
				{
					//Combat room above
					return "ul";
				}
				else if(down_val != "w")
				{
					//Combat room below
					return "dr"; //Mirrored
				}
				else if(right_val != "w")
				{
					//Combat room right
					return "lr";
				}
			}
			else if(string_count("1", right_val) > 0) //proc gen right
			{
				if(up_val != "w") 
				{
					//Combat room above
					return "ul"; //Mirrored
				}
				else if(down_val != "w")
				{
					//Combat room below
					return "dr";				
				}
				else if(left_val != "w")
				{
					//Combat room left
					return "lr";
				}
			}
		}
		else if(total_adjacent_proc_gen == 2) //Intermediate proc gen block forming a path
		{
			if(string_count("1", up_val) > 0)
			{
				if(string_count("1", down_val) > 0)
				{
					//Column block
					return "ud";
				}
				else if(string_count("1", left_val) > 0)
				{
					//Left and Up corner block
					return "ul";
				}
				else if(string_count("1", right_val) > 0)
				{
					//right and up corner block
					return "ul"; //Mirrored
				}
			}
			else if(string_count("1", down_val) > 0)
			{
				//Don't worry about up down case, already checked
				if(string_count("1", left_val) > 0)
				{
					//down and left corner block
					return "dr"; //Mirrored
				}
				else if(string_count("1", right_val) > 0)
				{
					//down and right corner block
					return "dr";					
				}
			}
			else if(string_count("1", left_val) > 0)
			{
				//Only remaining case is a hallway block
				return "lr";
			}
			
		}
		return "No matching hallway";
}

function Get_Combat_Room(room_string) {
	if(room_string == "c3c")
	{
		switch (global.phase) {
			case 1:
				return spr_3x3_Combat_Phase1;
			case 2:
				return spr_3x3_Combat_Phase2;
			case 3:
				return spr_3x3_Combat_Phase3;
		}
	}
	else if(room_string == "c2c") //2x2 Combat room
	{
		switch (global.phase) {
			case 1:
				return spr_2x2_Combat_Phase1;
			case 2:
				return spr_2x2_Combat_Phase2;
			case 3:
				return spr_2x2_Combat_Phase3;
		}
	}
}

function Get_DR_Hallway() {
	switch (global.phase) {
		case 1:
			return spr_dr1_Phase1;
		case 2:
			return spr_dr1_Phase2;
		case 3:
			return spr_dr1_Phase3;
	}
}

function Get_LR_Hallway() {
	switch (global.phase) {
		case 1:
			return spr_lr_Phase1;
		case 2:
			return spr_lr_Phase2;
		case 3:
			return spr_lr_Phase3;
	}
}

function Get_UD_Hallway() {
	switch (global.phase) {
		case 1:
			return spr_ud1_Phase1;
		case 2:
			return spr_ud1_Phase2;
		case 3:
			return spr_ud1_Phase3;
	}
}

function Get_UL_Hallway() {
	switch (global.phase) {
		case 1:
			return spr_ul1_Phase1;
		case 2:
			return spr_ul1_Phase2;
		case 3:
			return spr_ul1_Phase3;
	}
}