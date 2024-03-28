// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Replace_Hallway_Chunks(layout_grid){
	var grid_height = ds_grid_height(layout_grid);
	var grid_width = ds_grid_width(layout_grid);
	for (var i = 0; i < grid_width; i++) {
	    for (var j = 0; j < grid_height; j++) {
			if(ds_grid_get(layout_grid, i, j) == "1" || ds_grid_get(layout_grid, i, j) == "1f") //For every hallway, check to see if we can replace it with
			// a two block chunk. 
			{
				//Check if we're in a right to left hallway section
				var mirror = false;
				if(ds_grid_get(layout_grid, i, j) == "1f")
				{
					mirror = true;
				}				
				
				var total_vertical_hallways = 1;
				var total_horizontal_hallways = 1;
				var top_y = j;
				var left_x = i;
				//Count the number of vertical hallways in a row
				//Check above, stopping when we run out of hallway chunks
				//Notably, we only need to check above since we iterate low to high through our blocks
				while(top_y < grid_height - 1 && (ds_grid_get(layout_grid, i, top_y + 1) == "1" || ds_grid_get(layout_grid, i, top_y + 1) == "1f"))
				{
					total_vertical_hallways += 1;
					top_y += 1;
				}
				//We now know how many vertical chunks are in a row. We need at least 4 to replace one
				while(total_vertical_hallways >= 4) //After we've started, we only need three left to add the column
				{
					//We have enough space to replace a hallway, so do it
					var replace_y = top_y - 1; //start one block down from the top so we don't replace the corner hallway
					ds_grid_set(layout_grid, i, replace_y, "1vc"); //Set this to the "corner" of the vertical hallway,
					//since we use the top left block of rooms to generate from the sprite
					ds_grid_set(layout_grid, i, replace_y - 1, "1v"); //This is the bottom half of the 2 length vertical block
					top_y = replace_y - 1; //The "Top" of our replaceable area becomes the bottom of the new room
					total_vertical_hallways -= 2; //Use this variable to count how many replaceable chunks there are left
					//This lets us know when we could possibly generate several 2 length vertical chunks in a row
				}
				
				
				//Now count horizontal hallways in a row, from left to right since that's the direction we iterate
				var temp_x = left_x;
				while(temp_x < grid_width - 1 && (ds_grid_get(layout_grid, temp_x + 1, j) == "1" || ds_grid_get(layout_grid, temp_x + 1, j) == "1f"))
				{
					total_horizontal_hallways += 1;
					temp_x += 1;
				}
				
				while(total_horizontal_hallways >= 4)
				{					
					//We have enough space for a horizontal hallway so replace the regular blocks
					var replace_x = left_x + 1; //Start one from the left so we don't replace corner hallways
					if(mirror)
					{
						ds_grid_set(layout_grid, replace_x, j, "1hcf"); //Blocks are read from the top left corner, so use
						//the left most block to generate this room
						ds_grid_set(layout_grid, replace_x + 1, j, "1hf"); //Second half of length 2 hallway
					}
					else
					{
						ds_grid_set(layout_grid, replace_x, j, "1hc"); //Blocks are read from the top left corner, so use
						//the left most block to generate this room
						ds_grid_set(layout_grid, replace_x + 1, j, "1h"); //Second half of length 2 hallway
					}
					left_x = replace_x + 1; //Set left_x so we can generate another horizontal hallway if we have space
					total_horizontal_hallways -= 2; //Like before, decrease this to count how many horizontal halways 
					// we can generate
				}
			}
		}
	}
}