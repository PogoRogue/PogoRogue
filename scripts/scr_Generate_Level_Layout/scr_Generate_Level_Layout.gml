function scr_Generate_Level_Layout(room_number, max_gen_width, prebuilt_rooms, total_non_random_rooms, generate_starting_room, min_distance_between_rooms, max_distance_between_rooms)
{

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
		if(rCount == 0)
		{//If we need a starting room, it goes here (stored in index 0 of prebuilt_rooms)
			if(generate_starting_room)
			{
				room_index = 0;
			}
			else
			{					
				room_index = irandom_range(total_non_random_rooms, total_rooms - 1); // Pick a prebuilt_room from the random rooms 		
			}
		}			
		else if(rCount == room_number - 2) //Where the shop room needs to go (stored in index 1)
		{
			room_index = 1;
		}
		else if(rCount == room_number - 1) //The last room is the boss room (stored in index 2)
		{
			room_index = 2;
		}
		else //Otherwise, we use a random combat room	
		{			
			room_index = irandom_range(total_non_random_rooms, total_rooms - 1); // Pick a prebuilt_room from the random rooms 		
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
		if(previous_room = -1)
		{
			//Marks the center of the room as the starting point
			ds_grid_set(layout_grid, currentX + floor(rWidth/2), currentY + floor(rHeight/2), "s");
		}

		// Update the previous room
		previous_room = [currentX, currentY, rWidth, rHeight];
		
		currentY += rHeight + irandom_range(min_distance_between_rooms, max_distance_between_rooms); // Move up by the height of our current room & random spacing
	
	} //End of for loop
	
	Remove_Useless_Tiles(layout_grid);
	
	var gate_positions = ds_list_create();
	// Scan for gate positions
	for (var i = 0; i < grid_width; i++) {
	    for (var j = 0; j < grid_height; j++) {
	        var current_cell = ds_grid_get(layout_grid, i, j);
	        if (string(current_cell) == "1") { // Is a hallway
	            // Check adjacent cells for room IDs (non-numeric values that are not "w" or "1")
	            var neighbours = [ds_grid_get(layout_grid, i-1, j), ds_grid_get(layout_grid, i+1, j),
	                              ds_grid_get(layout_grid, i, j+1), ds_grid_get(layout_grid, i, j-1)];
								  
	            for (var k = 0; k < array_length_1d(neighbours); k++) {
					var neighbour = neighbours[k];
	                var n_value = string(neighbour);
	                if (n_value != "1" && n_value != "w" && n_value != "0") {
	                    // We found a transition from hallway to room, add to gate positions.
	                    ds_list_add(gate_positions, [i, j]);
	                    break; // Skip checking other neighbours since we found our gate position.
	                }
	            }
	        }
	    }
	}
	
	// Loop through our gate positions to create gates at the stored positions.
	for (var i = 0; i < ds_list_size(gate_positions); i++) {
		var pos = ds_list_find_value(gate_positions, i);
		var gate_x = pos[0];
		var gate_y = pos[1];
		// Convert grid pos to room coords and create gate instance
		cell_size = 32; // Size of our cells in the grid. not sure if 32x16 = 512 pixels per room? or if this is what we set to honestly.
		var room_x = gate_x * cell_size + cell_size;
		var room_y = gate_y * cell_size + cell_size;
		var inst = instance_create_layer(room_x, room_y, "Instances", obj_room_gate_close);
		if (inst == noone) {
			show_debug_message("Gate instance could not be created");
		}
		instance_create_layer(room_x, room_y, "Instances", obj_room_gate_open);
		show_debug_message("Gate Placed at: " + string(room_x) + ", " + string(room_y));
	}
	
	// Delete to prevent memory leaks
	//ds_list_destroy(gate_positions);
						

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

	// Function to connect two rooms with a winding path
function Connect_Rooms(layout_grid, room1_x, room1_y, room1_width, room1_height, room2_x, room2_y, room2_width, room2_height) {
	var start_x = room1_x + irandom(room1_width - 1);
	var start_y = room1_y;
	var end_x = room2_x + irandom(room2_width - 1);
	var end_y = room2_y;
	
	//For the special case our end room is a 1x1, we need to enter from the bottom, so lets target the grid just below it
	if(room2_height == 1 && room2_width == 1)
	{
		end_y = room2_y - 1; //Notably, we will need to make sure to fill this in with a 1 at the end,
		//since it breaks the condition of the while loop below
	}
	
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
				ds_grid_set(layout_grid, start_x, start_y, "1");
		}
		
		if (path_randomizer <= 0.6) {	//path upwards 60% of the time	(see special cases above)	
			start_y += 1;
		}
		else {			//Otherwise path sideways
			start_x += (end_x - start_x) / abs(end_x - start_x);
		}
	}
	//Do an extra set after the while loop for 1x1s since we target a grid outside the room
	if(room2_height == 1 && room2_width == 1){
		if (ds_grid_get(layout_grid, start_x, start_y) == "0") {
					ds_grid_set(layout_grid, start_x, start_y, "1");
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
		