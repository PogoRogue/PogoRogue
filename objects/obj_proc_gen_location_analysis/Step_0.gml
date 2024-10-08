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
}
if(instance_exists(obj_blink_box_strike))
{
	var player = instance_nearest(x, y, obj_blink_box_strike);
	currentX = player.x;
	var y_bias = 10; //Bias to prevent flickering when the player jumps on the ground bordering two different regions
	currentY = player.y - y_bias;
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
	
	//Load/Unload logic
	if(perform_region_load_unload)
	{
		//Count how long we've been in the current region. If it's been long enough, check load/unload conditions
		if(currentRegion == load_counter_region_previous)
		{
		load_counter += 1;
		}
		else
		{
			load_counter = 0;
			load_counter_region_previous = currentRegion;
		}
		
		if(load_counter >= load_counter_max)
		{
			load_counter = 0;
			if(currentRegion > player_max_region)
			{
				player_max_region = currentRegion;
		
				if(currentRegion < ds_list_size(region_loading_list) - 1)
				{
					//Load region + 1 from the current player
					var region_to_load = region_loading_list[| currentRegion + 1]
					scr_Load_Region(region_to_load);
					region_loaded[|currentRegion + 1] = true;
			
					show_debug_message("Region " + string(currentRegion + 1) + " loaded. X: " + string(region_to_load.left_x) + ", Y: "
					+ string(region_to_load.top_y) + ", Width: " + string(region_to_load.r_width) + ", Height: " + string(region_to_load.r_height));
			
				}		
				if(currentRegion > 1)
				{
					//Unload region -2 from current player
					var region_to_unload = region_loading_list[| currentRegion - 2]
					scr_Unload_Region(region_to_unload);
					region_loaded[|currentRegion - 2] = false;
			
					show_debug_message("Region " + string(currentRegion - 2) + " unloaded. X: " + string(region_to_unload.left_x) + ", Y: "
					+ string(region_to_unload.top_y) + ", Width: " + string(region_to_unload.r_width) + ", Height: " + string(region_to_unload.r_height));
			
				}
			}
		}
	}
}
else
{
	player_location_string = "none";
}




//fix minimap glitch
if above_shop = false and instance_exists(obj_shop_indicator) {
	with obj_player {
		if y < obj_shop_indicator.y {
			other.above_shop = true; 
		}
	}
}

if in_shop = false and instance_exists(obj_shop_indicator2) {
	with obj_player {
		if y < obj_shop_indicator2.y {
			other.in_shop = true; 
		}
	}
}