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
	else if(room_name == "1hc" || room_name == "1hcf")
	{
		ds_grid_set(other.signature_grid, tag_grid_location[0] + 1, tag_grid_location[1], self);
	}
}

//Given both the layout and tag grids, add labels to the tags corresponding to their region
var current_region = 0;
var prev_region_was_hallway = false;
for(var i = 0; i < ds_grid_height(layout_grid); i++) //Iterate from bottom to top, left to right
{
	for(var j = 0; j < ds_grid_width(layout_grid); j++)
	{
		var room_name = ds_grid_get(layout_grid, j, i);
		if(room_name == "c3c" || room_name == "c2c" || room_name == "Tc" || room_name == "Shc" || room_name == "Bc")
		{
			if(prev_region_was_hallway) //Increment region before setting if we were in a hallway previously
			{
				current_region += 1;
				prev_region_was_hallway = false;
			}
			var tag_object = ds_grid_get(signature_grid, j, i);
			if(instance_exists(tag_object))
				tag_object.proc_gen_region = current_region; //Set the region of the tag object
			current_region += 1; //increment the region number since there's only one tag per room
		}
		else if(room_name == "1" || room_name == "1f" || room_name == "1vc" || room_name == "1vcf" || room_name == "1hc" || room_name == "1hcf")
		{
			prev_region_was_hallway = true;
			var tag_object = ds_grid_get(signature_grid, j, i);
			if(instance_exists(tag_object))
				tag_object.proc_gen_region = current_region;
			//notably DON'T increment the region count in a hallway, since all connected hallways are the same region
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

with(obj_enemy_parent)
{
    var tag_grid_location = scr_Get_Grid_Coord_From_Room_Coord(x, y);
    var tag_object = ds_grid_get(other.signature_grid, tag_grid_location[0], tag_grid_location[1]);
    if(instance_exists(tag_object))
    {
        // Get the region tag from the tag object
        var region_tag = tag_object.proc_gen_region;
		
		if (region_tag == "2") {
			asset_add_tags(id, "CombatRoom1", asset_object);
			//show_debug_message("Assigned " + "CombatRoom1" + " to object ID: " + string(id));
		}
		else if (region_tag == "6") {
			asset_add_tags(id, "CombatRoom2", asset_object);
			//show_debug_message("Assigned " + "CombatRoom2" + " to object ID: " + string(id));
		}
			
        
        // Assign the region tag to the instance
    }
}






