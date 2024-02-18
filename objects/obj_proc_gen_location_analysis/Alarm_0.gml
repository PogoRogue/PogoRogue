/// @description Build tag object grid now that they're created

//Copy the layout grid to the tag grid, which we'll fill with matching tag objects
signature_grid = ds_grid_create(ds_grid_width(layout_grid), ds_grid_height(layout_grid));


with(obj_pixel_tag) //Loops through EVERY tag object to add to the signature ds_grid
{
	var tag_grid_location = scr_Get_Grid_Coord_From_Room_Coord(x, y);
	var room_name = ds_grid_get(other.layout_grid, tag_grid_location[0], tag_grid_location[1]);
	chunk_type = string(room_name);
	sprite_name = sprite_get_name(scr_Choose_Block_To_Generate(other.layout_grid, tag_grid_location[0], tag_grid_location[1]));
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


