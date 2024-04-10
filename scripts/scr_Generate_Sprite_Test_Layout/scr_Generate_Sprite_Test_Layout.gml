function scr_Generate_Sprite_Test_Layout(prebuilt_rooms, generate_starting_room, generate_boss_room, width_between_rooms, height_between_rooms)
{
	
	var room_number = 3;
	// Create a grid to hold our layout
	var grid_height = 20;
	var grid_width = 15;

	var layout_grid = ds_grid_create(grid_width + 1, grid_height + 1); // +1 since we start at 0

	var currentY = 1; //Start above the bottom of the grid so that we can put walls below it
	var currentX = 0;
	var previous_room = -1;
	//For test purposes, we expect the following room order of prebuilts:
	//Index 0: Starting room
	//Index 1: Shop Room
	//Index 2: Boss Room
	//Index 3: Combat room, 2x2
	//Index 4: Combat room, 3x3
	var room_index = 0; //Keeps track of which room we're about to generate
	
	for (var rCount = 0; rCount < room_number; rCount++) 
	{
		//If we want to test a starting room, generate that first. Otherwise, just make a 2x2	
		if(rCount == 0)
		{//If we need a starting room, it goes here (stored in index 0 of prebuilt_rooms)
			if(generate_starting_room)
			{
				room_index = 0; //Starting room
			}
			else
			{					
				room_index = 3;	//3x3
			}
		}			
		else if(rCount == room_number - 2) //Where the shop room needs to go (stored in index 1)
		{
			room_index = 1;
		}
		else if(rCount == room_number - 1) //The last room is the boss room (stored in index 2) if it's enabled
		{
			if(generate_boss_room)
			{
			room_index = 2;
			}
			else //Otherwise make a 3x3
			{
			room_index = 4;
			}
		}
		else //Otherwise, we use a 3x3 combat room
		{			
			room_index = 3;
		}		
		
		//Now that a room type has been selected, use it's values to add it to the layout
		var r = ds_list_find_value(prebuilt_rooms, room_index);		
		var rWidth = r[0];
		var rHeight = r[1];
		var room_id = r[2];
		//show_debug_message("Y: " + string(currentY));
		//For test purposes, place the first room on the left side
		if(rCount == 0)
		{
		currentX = 1;
		}
		else if(rCount == 1) //Go far right for shop room
		{
		currentX = width_between_rooms;	
		}
		else if(rCount == 2) //Go far left for last rooms
		{
		currentX = floor(width_between_rooms/2);	
		}

		// Ensure rooms are in the grid bounds
		if (!(
		currentY >= 0 &&
		currentX >= 0 &&
		currentY + rHeight <= grid_height + 1 &&
		currentX + rWidth <= grid_width
		)) {
			ds_grid_resize(layout_grid, grid_width+1, (grid_height*2)+1);
			grid_height *= 2;
		}
		// Connect the rooms with winding paths
		if (previous_room != -1) {
			Connect_Rooms(layout_grid, previous_room[0], previous_room[1]+previous_room[3] - 1, previous_room[2], previous_room[3], currentX, currentY, rWidth, rHeight);
		}

		// Place the current room
		for (var roomX = currentX; roomX < currentX + rWidth; roomX++) {
			 for (var roomY = currentY; roomY < currentY + rHeight; roomY++) {
				ds_grid_set(layout_grid, roomX, roomY, room_id);
				//Mark corners of rooms
				if(roomX == currentX && roomY == currentY + rHeight - 1)
				{
					ds_grid_set(layout_grid, roomX, roomY, room_id + "c")
				}
			}
		}
		
		//Set player starting point if this is the first room
		if(previous_room == -1)
		{
			//Marks the center of the room as the starting point
			ds_grid_set(layout_grid, currentX + floor(rWidth/2), currentY + floor(rHeight/2), "s");
		}

		// Update the previous room
		previous_room = [currentX, currentY, rWidth, rHeight];
		
		
		if(rCount == 0)
		{
		currentY += rHeight + ceil(height_between_rooms/4) // Move up by the height of our current room & the exact amount 
		//we need to move up to see all variants of hallways
		}
		else if(rCount == 1) //Go more vertical for second stretch
		{
		currentY += rHeight + height_between_rooms
		}
		
	
	} //End of for loop
	
	Remove_Useless_Tiles(layout_grid);		
	
	//Replace 1 block hallway chunks with 2 block chunks where possible
	scr_Replace_Hallway_Chunks_Test(layout_grid);			

	// Show the grid in the console
	for (var i = grid_height; i >= 0; i--) {
	    var row = "";
	    for (var j = 0; j < grid_width + 1; j++) {
	        row += " ";
	        row += string(ds_grid_get(layout_grid, j, i));
			if (string_length(ds_grid_get(layout_grid, j, i)) == 1) {
				row += "  ";
			}
	    }
	    show_debug_message(row);
	}
	
	// For testing
	/*global.debug_draw = true; // Set this to false to stop debugging rectangles.
	if (global.debug_draw) {
		for (var i = 0; i < ds_list_size(gate_positions); i++) {
			var pos = ds_list_find_value(gate_positions, i);
			var debug_x = pos[0];
			var debug_y = pos[1];
			draw_set_color(c_red);
			draw_rectangle(debug_x, debug_y, debug_x + 512, debug_y + 512, true);
		}
	}*/
	
	return layout_grid;
}
