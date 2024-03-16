///@desc Given a proc gen layout grid, and a location in it, decides what kind of block needs to go there
///@returns number corresponding to sprite to build, 0 corresponding to player start, or -1 for generate nothing
function scr_Choose_Test_Block_To_Generate(layout_grid, grid_x, grid_y){
	var room_string = ds_grid_get(layout_grid, grid_x, grid_y);
	
	if(room_string == "c3c") //3x3 test room
	{
		return spr_3x3_Combat_Test;
	}
	else if(room_string == "c2c") //2x2 test room
	{
		return spr_2x2_Combat_Test;
	}
	else if(room_string == "Tc") //Player start test room
	{
		return spr_start;
	}	
	else if(room_string == "Shc") //Shop test room
	{
		return spr_1x1_Shop_Hallway_Test;
	}
	else if(room_string == "Bc") //Boss teleporter test room
	{
		return spr_1x1_boss_portal_test;
	}
	else if(room_string == "s") //s marks the player start!
	{
		return 0;
	}
	else if(room_string == "1hc" || room_string == "1hcf") //Marks the corner of a horizontal length 2 hallway chunk
	{
		return spr_lr_length2_test;
	}
	else if(room_string == "1vc" || room_string == "1vcf") //Marks the corner of a vertical length 2 hallway chunk
	{
		return spr_ud_length2_test;
	}
	else if(room_string == "1" || room_string == "1f") //Decide what proc gen block to use
	{
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
					return spr_ud_test;
				}
				else if(left_val != "w")
				{
					//Combat room left
					return spr_ul_test;
				}
				else if(right_val != "w")
				{
					//Combat room right
					return spr_ul_test; //Mirrored
				}
			}
			else if(string_count("1", down_val) > 0) //Proc gen block below
			{
				if(up_val != "w")
				{
					//Combat room above
					return spr_ud_test;
				}
				else if(left_val != "w")
				{
					//Combat room left
					return spr_dr_test; //Mirrored
				}
				else if(right_val != "w")
				{
					//Combat room right
					return spr_dr_test;
				}
			}
			else if(string_count("1", left_val) > 0) //Proc gen block left
			{
				if(up_val != "w")
				{
					//Combat room above
					return spr_ul_test;
				}
				else if(down_val != "w")
				{
					//Combat room below
					return spr_dr_test; //Mirrored
				}
				else if(right_val != "w")
				{
					//Combat room right
					return spr_lr_test;
				}
			}
			else if(string_count("1", right_val) > 0) //proc gen right
			{
				if(up_val != "w") 
				{
					//Combat room above
					return spr_ul_test; //Mirrored
				}
				else if(down_val != "w")
				{
					//Combat room below
					return spr_dr_test;					
				}
				else if(left_val != "w")
				{
					//Combat room left
					return spr_lr_test;
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
					return spr_ud_test;
				}
				else if(string_count("1", left_val) > 0)
				{
					//Left and Up corner block
					return spr_ul_test;
				}
				else if(string_count("1", right_val) > 0)
				{
					//right and up corner block
					return spr_ul_test; //Mirrored
				}
			}
			else if(string_count("1", down_val) > 0)
			{
				//Don't worry about up down case, already checked
				if(string_count("1", left_val) > 0)
				{
					//down and left corner block
					return spr_dr_test; //Mirrored
				}
				else if(string_count("1", right_val) > 0)
				{
					//down and right corner block
					return spr_dr_test;					
				}
			}
			else if(string_count("1", left_val) > 0)
			{
				//Only remaining case is a hallway block
				return spr_lr_test;
			}
			
		}
	}
	return -1; //No current valid block for the conditions
}