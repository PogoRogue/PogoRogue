function scr_Generate_Level_Layout(room_number, max_gen_width, prebuilt_rooms, total_non_random_rooms, generate_starting_room, min_height_between_rooms, max_height_between_rooms)
{
	random_set_seed(global.seed);
	// Create a grid to hold our layout
	var grid_height = 10;
	var grid_width = max_gen_width;

	var layout_grid = ds_grid_create(grid_width + 1, grid_height + 1); // +1 since we start at 0

	var currentY = 1; //Start above the bottom of the grid so that we can put walls below it
	var currentX = 0;
	var previous_room = -1;
	var total_rooms = ds_list_size(prebuilt_rooms);
	var room_index = 0; //Keeps track of which room we're about to generate
	
	for (var rCount = 0; rCount < room_number; rCount++) 
	{	
		if(rCount == 0 && generate_starting_room && total_non_random_rooms >= 1)
		{//If we need a starting room, it goes here (stored in index 0 of prebuilt_rooms)
			room_index = 0;	
		}			
		else if(rCount == room_number - 3 && total_non_random_rooms >= 3) //Where the shop room needs to go (stored in index 1)
		{
			room_index = 1;
		}
		else if(rCount == room_number - 1 && total_non_random_rooms >= 2) //The last room is the boss room (stored in index 2)
		{
			room_index = 2;
		}
		else //Otherwise, we use a random combat room	
		{			
			//Old 50/50 to choose 2x2 or 3x3
			//room_index = irandom_range(total_non_random_rooms, total_rooms - 1); // Pick a prebuilt_room from the random rooms 		
			
			//New chance of choosing a 2x2 or 3x3 is directly proportional to the amount of possible rooms
			
			var total_possible_room_types = total_rooms - total_non_random_rooms;
			var room_sprite_freq = array_create(total_possible_room_types);
			var index = 0;
			for(room_index = total_non_random_rooms; room_index <= total_rooms - 1; room_index++)
			{
				var room_type = ds_list_find_value(prebuilt_rooms, room_index)[2];	//returns string such as c3 or c2
				room_type += "c"; //Add the corner tag so we can use the following script
				var room_sprite = Get_Combat_Room(room_type);
				room_sprite_freq[index] = sprite_get_number(room_sprite); //Get the number of frames to use for frequency
				index += 1;
			}
			
			//Use "Cumulative share" method to randomly select an index
			
			// Calculate the total sum
			var totalSum = 0;
			for (var i = 0; i < array_length(room_sprite_freq); i++) {
			    totalSum += room_sprite_freq[i];
			}

			// Calculate cumulative share percentages
			var cumulativePercentage = 0;
			var sharePercentages = [];
			for (var i = 0; i < array_length(room_sprite_freq); i++) {
			    var percentage = room_sprite_freq[i] / totalSum;
			    cumulativePercentage += percentage;
			    sharePercentages[i] = cumulativePercentage;
			}

			// Generate a random number between 0 and 1
			var randomValue = random(1);

			// Find the corresponding index based on the random value
			var selectedIndex = -1;
			for (var i = 0; i < array_length(sharePercentages); i++) {
			    if (randomValue <= sharePercentages[i]) {
			        selectedIndex = i;
			        break;
			    }
			}
			
			room_index = total_non_random_rooms + selectedIndex;		
		
		}		
		
		//Now that a room type has been selected, use it's values to add it to the layout
		var r = ds_list_find_value(prebuilt_rooms, room_index);		
		var rWidth = r[0];
		var rHeight = r[1];
		var room_id = r[2];
		//show_debug_message("Y: " + string(currentY));
		currentX = irandom_range(1, grid_width - rWidth - 1); // Random X axis placement 
		//within room with at least 1 space between room and grid edge

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
			if(generate_start_room)
			{
				ds_grid_set(layout_grid, currentX, currentY, "s");
			}
			else
			{
				//Marks the center of the room as the starting point
				ds_grid_set(layout_grid, currentX + floor(rWidth/2), currentY + floor(rHeight/2), "s");
			}
		}

		// Update the previous room
		previous_room = [currentX, currentY, rWidth, rHeight];
		
		currentY += rHeight + irandom_range(min_height_between_rooms, max_height_between_rooms); // Move up by the height of our current room & random spacing
	
	} //End of for loop
	
	Remove_Useless_Tiles(layout_grid);
	
	//Replace 1 block hallway chunks with 2 block chunks where possible
	scr_Replace_Hallway_Chunks(layout_grid);

	//// Show the grid in the console
	//for (var i = grid_height; i >= 0; i--) {
	//    var row = "";
	//    for (var j = 0; j < grid_width + 1; j++) {
	//        row += " ";
	//        row += string(ds_grid_get(layout_grid, j, i));
	//		if (string_length(ds_grid_get(layout_grid, j, i)) == 1) {
	//			row += "  ";
	//		}
	//    }
	//    show_debug_message(row);
	//}
	
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

	// Function to connect two rooms with a winding path
function Connect_Rooms(layout_grid, room1_x, room1_y, room1_width, room1_height, room2_x, room2_y, room2_width, room2_height) {
	var start_x = room1_x + irandom(room1_width - 1);
	var start_y = room1_y + 1;
	var end_x = room2_x + irandom(room2_width - 1);
	var end_y = room2_y - 1;
	
	var mirror = false;
	if(start_x > end_x) //In this case, we need to mirror hallway chunks
	{
		mirror = true;
	}
	
	////For the special case our end room is a 1x1, we need to enter from the bottom, so lets target the grid just below it
	//if(room2_height == 1 && room2_width == 1)
	//{
	//	end_y = room2_y - 1; //Notably, we will need to make sure to fill this in with a 1 at the end,
	//	//since it breaks the condition of the while loop below
	//}
	
	while (start_x != end_x || start_y != end_y) {
		var path_randomizer = random_range(0,1);
		
		//Navigate directly up or sideways if we're already at the correct x/y coord
		if (start_x == end_x) {
			path_randomizer = 0;
		}
		else if (start_y == end_y) {
			path_randomizer = 1;
		}
		
		//Don't exit a 2 height or smaller room from the left or right
		if(room1_height <= 2 && start_y == room1_y)
		{
			path_randomizer = 0;
		}
		
		if (ds_grid_get(layout_grid, start_x, start_y) == "0") {
			if(mirror)
			{
				ds_grid_set(layout_grid, start_x, start_y, "1f");  //"1f" for 'flipped'
			}
			else
			{
				ds_grid_set(layout_grid, start_x, start_y, "1"); //Regular 1 for left to rights
			}
		}
		
		if (path_randomizer <= 0.6) {	//path upwards 60% of the time	(see special cases above)	
			start_y += 1;
		}
		else {			//Otherwise path sideways
			start_x += (end_x - start_x) / abs(end_x - start_x);
		}
	}
	//Do an extra set after the while loop since we target a grid outside the room
	if (ds_grid_get(layout_grid, start_x, start_y) == "0") {
			if(mirror)
			{
				ds_grid_set(layout_grid, start_x, start_y, "1f");  //"1f" for 'flipped'
			}
			else
			{
				ds_grid_set(layout_grid, start_x, start_y, "1"); //Regular 1 for left to rights
			}
	}
}

function Remove_Useless_Tiles(layout_grid)
{
	var grid_height = ds_grid_height(layout_grid);
	var grid_width = ds_grid_width(layout_grid);
	for (var i = 0; i < grid_width; i++) {
	    for (var j = 0; j < grid_height; j++) {
			if(ds_grid_get(layout_grid, i, j) == "0")
			{
				var up_grid = "0";
				var down_grid = "0";
				var left_grid = "0";
				var right_grid = "0";
				var up_left_grid = "0";
				var up_right_grid = "0";
				var down_left_grid = "0";
				var down_right_grid = "0";
				
				if(j < grid_height - 1)
				{
				up_grid = ds_grid_get(layout_grid, i, j + 1);
				if(i > 0)
				up_left_grid = ds_grid_get(layout_grid, i - 1, j + 1);
				if(i < grid_width - 1)
				up_right_grid = ds_grid_get(layout_grid, i + 1, j + 1);
				}
				
				if(j > 0)
				{					
				down_grid = ds_grid_get(layout_grid, i, j - 1);
				if(i > 0)
				down_left_grid = ds_grid_get(layout_grid, i - 1, j - 1);
				if(i < grid_width - 1)
				down_right_grid = ds_grid_get(layout_grid, i + 1, j - 1);	
				}
				
				if(i > 0)
				left_grid = ds_grid_get(layout_grid, i - 1, j);
				
				if(i < grid_width - 1)
				right_grid = ds_grid_get(layout_grid, i + 1, j);
	
			
				//Big check to see if any of the grids next to this (including diagonals) are non empty and non wall
				if((up_grid != "0" && up_grid != "w") ||
				(down_grid != "0" && down_grid != "w") ||
				(left_grid != "0" && left_grid != "w") ||
				(right_grid != "0" && right_grid != "w") ||
				(up_left_grid != "0" && up_left_grid != "w") ||
				(up_right_grid != "0" && up_right_grid != "w") ||
				(down_left_grid != "0" && down_left_grid != "w") ||
				(down_right_grid != "0" && down_right_grid != "w")){
					ds_grid_set(layout_grid, i, j, "w")
				}
			}
	    }
	}
}

function Show_Grid_In_Console(layout_grid)
{
	var grid_height = ds_grid_height(layout_grid)
	var grid_width = ds_grid_width(layout_grid)
		// Show the grid in the console
	for (var i = grid_height - 1; i >= 0; i--) {
	    var row = "";
	    for (var j = 0; j < grid_width; j++) {
	        row += " ";
	        row += string(ds_grid_get(layout_grid, j, i));
			if (string_length(ds_grid_get(layout_grid, j, i)) == 1) {
				row += "  ";
			}
	    }
	    show_debug_message(row);
	}
}
		