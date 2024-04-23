/// @description Build tag object grid now that they're created

//Copy the layout grid to the tag grid, which we'll fill with matching tag objects
signature_grid = ds_grid_create(ds_grid_width(layout_grid), ds_grid_height(layout_grid));

with(obj_pixel_tag) //Loops through EVERY tag object to add to the signature ds_grid
{
	var tag_grid_location = scr_Get_Grid_Coord_From_Room_Coord(x, y);
	var room_name = ds_grid_get(other.layout_grid, tag_grid_location[0], tag_grid_location[1]);
	chunk_type = string(room_name);
	ds_grid_set(other.signature_grid, tag_grid_location[0], tag_grid_location[1], self)
	
	if(room_name == "c3c" || room_name == "c2c" || room_name == "Tc")
	{		
		if(room_name == "c2c")
		{
			var combat_room_width = 2;
			var combat_room_height = 2;
		}
		else
		{
			var combat_room_width = 3;
			var combat_room_height = 3;
		}
		for(var i = 0; i < combat_room_width; i++)
		{
			for(var j = 0; j < combat_room_height; j++)
			{
				ds_grid_set(other.signature_grid, tag_grid_location[0] + i, tag_grid_location[1] - j, self);
			}
		}
	}
	else if(room_name == "1vc" || room_name == "1vcf")
	{
		ds_grid_set(other.signature_grid, tag_grid_location[0], tag_grid_location[1] - 1, self);
	}
	else if(room_name == "1hc")
	{
		ds_grid_set(other.signature_grid, tag_grid_location[0] + 1, tag_grid_location[1], self);
	}
	else if(room_name == "1hf") //This is a flipped room of length 2. Tag object will appear in right half instead of left half,
	//so set the grid left of this to be tagged with the same object
	{
		ds_grid_set(other.signature_grid, tag_grid_location[0] - 1, tag_grid_location[1], self);
	}
}

//Given both the layout and tag grids, add labels to the tags corresponding to their region
var current_region = 0;
var prev_region_was_hallway = false;

var hallway_region_struct = create_region_struct(0,0,0,0); //Initialize hallway region struct variable before loop
for(var i = 0; i < ds_grid_height(layout_grid); i++) //Iterate from bottom to top, left to right
{
	for(var j = 0; j < ds_grid_width(layout_grid); j++)
	{
		var room_name = ds_grid_get(layout_grid, j, i);
		if(room_name == "c3c" || room_name == "c2c" || room_name == "Tc" || room_name == "Bc")
		{
			if(prev_region_was_hallway) //Increment region before setting if we were in a hallway previously
			{
				current_region += 1;
				prev_region_was_hallway = false;
				
				//Since we've finished updating the size of the hallway region, we can add it to the list
				ds_list_add(region_loading_list, hallway_region_struct);
			}
			var tag_object = ds_grid_get(signature_grid, j, i);
			if(instance_exists(tag_object))
			{
				tag_object.proc_gen_region = current_region; //Set the region of the tag object
				highest_region = current_region;
			}
			current_region += 1; //increment the region number since there's only one tag per room
			
			var region_Load_Width = PROC_GEN_BLOCK_PIXEL_WIDTH - 2; //We need to load/unload a smaller area
			//Than the exact width of a region, or we accidentally unload things bordering that region.
			
			//Create region struct for combat room for loading and unloading
			var room_coord = scr_Get_Room_Coord_From_Grid_Coord(j, i)
			var rm_width = region_Load_Width;
			var rm_height = region_Load_Width;
			if(room_name == "c3c")
			{
				rm_width = PROC_GEN_BLOCK_PIXEL_WIDTH * 3 - 2;
				rm_height = PROC_GEN_BLOCK_PIXEL_WIDTH * 3 - 2;
			}
			else if(room_name == "c2c")
			{
				rm_width = PROC_GEN_BLOCK_PIXEL_WIDTH * 2 - 2;
				rm_height = PROC_GEN_BLOCK_PIXEL_WIDTH * 2 - 2;
			}
			else if(room_name == "Tc")
			{
				rm_height = PROC_GEN_BLOCK_PIXEL_WIDTH * 2 - 2;
			}			
			var region_struct = create_region_struct(room_coord[0] + 1, room_coord[1] + 1, rm_width - 2, rm_height - 3);
			//Add region struct to load list
			ds_list_add(region_loading_list, region_struct);
		}
		else if(room_name == "1" || room_name == "1f" || room_name == "1vc" || room_name == "1vcf" || room_name == "1hc" || room_name == "1hcf" || room_name =="Shc")
		{
			//Check if this block starts a hallway region. If so, make a new region struct
			if(!prev_region_was_hallway)
			{
				var room_coord = scr_Get_Room_Coord_From_Grid_Coord(j, i)
				var rm_width = region_Load_Width;
				var rm_height = region_Load_Width;
				hallway_region_struct = create_region_struct(room_coord[0], room_coord[1], rm_width - 1, rm_height - 1);
			}
			else //Otherwise, update the current region with this room's coordinates
			{
				var room_coord = scr_Get_Room_Coord_From_Grid_Coord(j, i)
				if(room_name == "1" || room_name == "1f" || room_name == "Shc")
				{
					var rm_width = region_Load_Width;
					var rm_height = region_Load_Width;
				}
				else if(room_name == "1vc" || room_name == "1vcf")
				{
					var rm_width = region_Load_Width;
					var rm_height = PROC_GEN_BLOCK_PIXEL_WIDTH * 2 - 2;
				}
				else if(room_name == "1hc" || room_name == "1hcf")
				{
					var rm_width = PROC_GEN_BLOCK_PIXEL_WIDTH * 2 - 2;
					var rm_height = region_Load_Width;
				}
				hallway_region_struct = update_region_struct_x(hallway_region_struct, room_coord[0]);
				hallway_region_struct = update_region_struct_y(hallway_region_struct, room_coord[1]);
				hallway_region_struct = update_region_struct_width(hallway_region_struct, room_coord[0] + rm_width - 1);
				hallway_region_struct = update_region_struct_height(hallway_region_struct, room_coord[1] + rm_height - 1);
			}
			
			prev_region_was_hallway = true;
			var tag_object = ds_grid_get(signature_grid, j, i);
			if(instance_exists(tag_object))
			{
				tag_object.proc_gen_region = current_region;
				highest_region = current_region;
			}
			//notably DON'T increment the region count in a hallway, since all connected hallways are the same region
			//UNLESS this is a shop block. Then we need to end the current region here, so that the hallway
			//after the shop is a new loaded region
			if(room_name == "Shc")
			{
				prev_region_was_hallway = false;
				current_region += 1;
			}
					
		}
	}
}

//Loop through all generated objects and give them the region tag we labeled above
with(obj_generated_object_parent)
{
	var tag_grid_location = scr_Get_Grid_Coord_From_Room_Coord(x, y);
	var tag_object = ds_grid_get(other.signature_grid, tag_grid_location[0], tag_grid_location[1]);
	if(instance_exists(tag_object))
	{
	proc_gen_tag = tag_object.proc_gen_region;
	}
	else
	{
		proc_gen_tag = -1;
	}
}

//Loop through enemies and give them region tags for gates
with(obj_enemy_parent)
{
    var tag_grid_location = scr_Get_Grid_Coord_From_Room_Coord(x, y);
    var tag_object = ds_grid_get(other.signature_grid, tag_grid_location[0], tag_grid_location[1]);
    if(instance_exists(tag_object) && tag_object.proc_gen_region != -1)
    {
        // Get the region tag from the tag object
        var region_tag = tag_object.proc_gen_region;		
		
		if(ds_list_size(other.region_enemy_count) <= region_tag) //If we haven't set this region yet, initialize to zero
		{
			ds_list_set(other.region_enemy_count, region_tag, 0);
		}
		var enemies_in_region = ds_list_find_value(other.region_enemy_count, region_tag);
		ds_list_set(other.region_enemy_count, region_tag, enemies_in_region + 1); //Increment region enemy count
    }
	else
	{
		show_debug_message("Couldn't add enemy to region count data structure");
		show_debug_message("Grid coord: " + string(scr_Get_Grid_Coord_From_Room_Coord(x, y)));
	}	
}

//Loop through gate object, and give them combat room location tags
with(obj_room_gate_close)
{
	//Grab the tag object below the gate, and use that for our tagging
	var tag_grid_location = scr_Get_Grid_Coord_From_Room_Coord(x, y + 50);
    var tag_object = ds_grid_get(other.signature_grid, tag_grid_location[0], tag_grid_location[1]);
    if(instance_exists(tag_object))
    {
        // Get the region tag from the tag object
        var region_tag = tag_object.proc_gen_region;
		proc_gen_tag = region_tag;
		
		total_enemies_in_region = ds_list_find_value(other.region_enemy_count, region_tag);
		current_enemies_in_region = total_enemies_in_region;
				
		//Add gate to gate list
		ds_list_set(other.region_gate_objects, region_tag, self);
    }	
}


//Set regions 0 and 1 to loaded in region_loaded
region_loaded[|0] = true;
region_loaded[|1] = true;

//Player starts in region zero, so deactivate regions 2+
for(var i = 2; i < ds_list_size(region_loading_list); i++)
{
	var region_to_unload = region_loading_list[| i];
	scr_Unload_Region(region_to_unload);
	region_loaded[|i] = false;
	show_debug_message("Region " + string(i) + " unloaded. X: " + string(region_to_unload.left_x) + ", Y: "
	+ string(region_to_unload.top_y) + ", Width: " + string(region_to_unload.r_width) + ", Height: " + string(region_to_unload.r_height));
}






