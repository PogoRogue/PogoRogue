/// @description Keep track of player location and log data
var currentX = 0;
var currentY = 0;
var currentRegion = -1;
if(instance_exists(obj_player))
{
	var player = instance_nearest(x, y, obj_player);
	currentX = player.x;
	var y_bias = 10; //Bias to prevent flickering when the player jumps on the ground bordering two different regions
	currentY = player.y - y_bias;
	
	if(keyboard_check(vk_shift))
	{
		show_debug_message("Player Coords: " + string(player.x) + ", " + string(player.y));
	}
}



//Convert player location to grid location
grid_location = scr_Get_Grid_Coord_From_Room_Coord(currentX, currentY);

//Use grid location to get matching signature tag object
current_tag_object = ds_grid_get(signature_grid, grid_location[0], grid_location[1]);
//show_debug_message(string(currentX) + " " + string(currentY));
if(instance_exists(current_tag_object))
{
	player_location_string = scr_Generate_Location_Message(current_tag_object);
	currentRegion = current_tag_object.proc_gen_region;
	if(ds_exists(region_gate_objects, ds_type_list))
	{
		var gate_val = ds_list_find_value(region_gate_objects, currentRegion);
		if(instance_exists(gate_val))
		{
			kills_left = gate_val.kills_left;
			if(kills_left > 0)
			{
				display_progress_bar = true;
			}
			else
			{
				display_progress_bar = false;
			}			
		}
		else
		{
			kills_left = 0;
		}
	}
}
else
{
	player_location_string = "none";
}




