function scr_Create_Gate_Objects_From_Grid(layout_grid){
	
	var grid_width = ds_grid_width(layout_grid);
	var grid_height = ds_grid_height(layout_grid);
	
	var tile_size = 16; // How many pixels a 1x1 ground tile is
	var room_block_size = 32; // How many object grid squares a 1x1 room is wide, like a hallway
	var room_pixel_width = tile_size * room_block_size; //Total pixels (And game room coords) wide each
	// element in the layout_grid represents
	
	var gate_positions = ds_list_create();
	
	//LOGIC FOR GATE POSITIONING, change later TODO
	// Scan for gate positions
	for (var i = 0; i < grid_width; i++) {
		for (var j = 0; j < grid_height; j++) {
			var current_cell = ds_grid_get(layout_grid, i, j);
			if (string_count("1", current_cell) > 0) 
			{ // Is a hallway
			    // Check cells below hallways for room IDs)
				var below_cell = ds_grid_get(layout_grid, i, j - 1);
					
				// Make sure it's not spawn, shop, hallway, or a wall.
			    if (string_count("1", below_cell) == 0 && string_count("T", below_cell) == 0 && 
				string_count("S", below_cell) == 0 && below_cell != "w" && below_cell != "0") 
				{
					var cell_left = ds_grid_get(layout_grid, i - 1, j);
					var cell_right = ds_grid_get(layout_grid, i + 1, j);
					// Find out where our actual exit is
					if (string_count("1", cell_left) > 0) {
						var left_left = ds_grid_get(layout_grid, i - 2, j);
						var left_up = ds_grid_get(layout_grid, i - 1, j + 1);
						if (string_count("1", left_left) > 0 || string_count("1", left_up) > 0) {
							ds_list_add(gate_positions, [i, j]);
						}
					}
					else if (string_count("1", cell_right) > 0) {
						var right_right = ds_grid_get(layout_grid, i + 2, j);
						var right_up = ds_grid_get(layout_grid, i + 1, j + 1);
						if (string_count("1", right_right) > 0 || string_count("1", right_up) > 0) {
							ds_list_add(gate_positions, [i, j]);
						}
					}
					else if (string_count("1", cell_left) == 0 && string_count("1", cell_right) == 0) {
						ds_list_add(gate_positions, [i, j]);
					}
					
					// Store gate pos along with exit direction in the list
						
			        // break; // Skip checking other neighbours since we found our gate position.
			    }
			}
		}
	}
	
	// Loop through our gate positions to create gates at the stored positions.
	for (var i = 0; i < ds_list_size(gate_positions); i++) {
        var pos = ds_list_find_value(gate_positions, i);
        placeGate(pos[0], pos[1], room_pixel_width);
    }
	
	// Delete to prevent memory leaks
    ds_list_destroy(gate_positions);
}
	
	
function placeGate(gate_x, gate_y, room_pixel_width) {
    var gate_width = 448; //hardcoded... change later TODO
    var gate_height = 32;

    // Convert grid pos to room coords and create gate instance
    var room_x = (gate_x * room_pixel_width) + (room_pixel_width / 2) - (gate_width / 2);
    var room_y = (gate_y * room_pixel_width * -1) + (512) - (gate_height); // Make sure its negative since room "up" is negative dir.

    var inst = instance_create_layer(room_x, room_y, "Instances", obj_room_gate_close);

    if (inst == noone) {
        show_debug_message("Gate instance could not be created");
	}
	else {
		 show_debug_message("Gate Placed at: " + string(room_x) + ", " + string(room_y));
	}
}