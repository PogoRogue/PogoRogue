function scr_Create_Gate_Objects_From_Grid(layout_grid){
	
	var grid_width = ds_grid_width(layout_grid);
	var grid_height = ds_grid_height(layout_grid);
	
	var tile_size = 16; //How many pixels a 1x1 ground tile is
	var room_block_size = 32; //How many object grid squares a 1x1 room is wide, like a hallway
	var room_pixel_width = tile_size * room_block_size; //Total pixels (And game room coords) wide each
	// element in the layout_grid represents
	
	var gate_positions = ds_list_create();
	// Scan for gate positions
	for (var i = 0; i < grid_width; i++) {
	    for (var j = 0; j < grid_height; j++) {
	        var current_cell = ds_grid_get(layout_grid, i, j);
	        if (string(current_cell) == "1") { // Is a hallway
	            // Check adjacent cells for room IDs (non-numeric values that are not "w" or "1")
	            var neighbours = [ds_grid_get(layout_grid, i-1, j), ds_grid_get(layout_grid, i+1, j),
	                              ds_grid_get(layout_grid, i, j+1), ds_grid_get(layout_grid, i, j-1)];
								  
	            for (var k = 0; k < array_length(neighbours); k++) {
					var neighbour = neighbours[k];
	                var n_value = string(neighbour);
					
	                if (n_value != "1" && n_value != "w" && n_value != "0") {
						// Determine exit direction based on relative position of hallways
						var exit_direction = determineExitDir(k);
						// Store gate pos along with exit direction in the list
						ds_list_add(gate_positions, [i, j, exit_direction]);
						
						/*
	                    // We found a transition from hallway to room, add to gate positions.
	                    ds_list_add(gate_positions, [i, j]);
						*/
						
	                    break; // Skip checking other neighbours since we found our gate position.
	                }
	            }
	        }
	    }
	}
	
	// Loop through our gate positions to create gates at the stored positions.
	for (var i = 0; i < ds_list_size(gate_positions); i++) {
        var pos = ds_list_find_value(gate_positions, i);
        placeGate(pos[0], pos[1], pos[2], room_pixel_width);
    }
	
	// Delete to prevent memory leaks
    ds_list_destroy(gate_positions);
}
	
	
function placeGate(gate_x, gate_y, exit_direction, room_pixel_width) {
    // Assuming gate objects have a size of 500x83 pixels and a pivot point at the top-left corner
    var gate_width = 500;
    var gate_height = 83;

    // Convert grid pos to room coords and create gate instance
    var room_x = (gate_x * room_pixel_width) + (room_pixel_width / 2) - (gate_width / 2);
    var room_y = (gate_y * room_pixel_width * -1) - (gate_height / 2);

    // Adjust gate rotation based on exit direction
    var rotation_angle = determineExitRot(exit_direction);

    var inst = instance_create_layer(room_x, room_y, "Instances", obj_room_gate_close);
    var inst2 = instance_create_layer(room_x, room_y, "Instances", obj_room_gate_open);

    if (inst == noone || inst2 == noone) {
        show_debug_message("Gate instance could not be created");
    } else {
        show_debug_message("Gate created!");
    }

    inst.image_angle = rotation_angle; // Apply rotation
    inst2.image_angle = rotation_angle; // Apply rotation

    show_debug_message("Gate Placed at: " + string(room_x) + ", " + string(room_y));
}

function determineExitDir(neighbour_index) {
	switch(neighbour_index) {
		case 0: // Left of Hallway
			show_debug_message("right");
		case 1: // Right of hallway
			show_debug_message("left");
			return "left"
		case 2: // Below hallway
			show_debug_message("top");
			return "top";
		case 3: // Above hallway
			show_debug_message("bottom");
			return "bottom";
	}
}

function determineExitRot(exit_direction) {
    switch(exit_direction) {
        case "left":
            return -90;
        case "right":
            return 90;
		case "top":
			return 0;
		case "bottom":
			return 0;
    }
}