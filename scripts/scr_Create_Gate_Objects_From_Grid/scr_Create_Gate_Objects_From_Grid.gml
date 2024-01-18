// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
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
		var gate_x = pos[0]; //Position of gate in layout_grid coords
		var gate_y = pos[1];
		// Convert grid pos to room coords and create gate instance
		var room_x = gate_x * room_pixel_width;
		var room_y = gate_y * room_pixel_width * -1; //Make it negative since room "up" is negative direction
		var inst = instance_create_layer(room_x, room_y, "Instances", obj_room_gate_close);
		if (inst == noone) {
			show_debug_message("Gate instance could not be created");
		}
		instance_create_layer(room_x, room_y, "Instances", obj_room_gate_open);
		show_debug_message("Gate Placed at: " + string(room_x) + ", " + string(room_y));
	}
	
	// Delete to prevent memory leaks
	ds_list_destroy(gate_positions);
	
}