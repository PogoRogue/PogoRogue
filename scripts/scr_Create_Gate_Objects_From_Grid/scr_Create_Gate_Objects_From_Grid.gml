function scr_Create_Gate_Objects_From_Grid(layout_grid){
	
	var grid_width = ds_grid_width(layout_grid);
	var grid_height = ds_grid_height(layout_grid);
	
	var tile_size = 16; // How many pixels a 1x1 ground tile is
	var room_block_size = 32; // How many object grid squares a 1x1 room is wide, like a hallway
	var room_pixel_width = tile_size * room_block_size; //Total pixels (And game room coords) wide each
	// element in the layout_grid represents
	
	var gate_positions_closed = ds_list_create();
	var gate_positions_open = ds_list_create();
	
	// Scan for gate positions
	for (var i = 0; i < grid_width; i++) {
		for (var j = 0; j < grid_height; j++) {
			var current_cell = ds_grid_get(layout_grid, i, j);
			if (string_count("1", current_cell) > 0) 
			{ 
				if(Connects_To_Combat_Room_Below(layout_grid, i, j))
				{
					ds_list_add(gate_positions_closed, [i, j]);
				}
				else if(Connects_To_Combat_Room_Above(layout_grid, i, j))
				{
					ds_list_add(gate_positions_open, [i, j]);
				}
			}
		}
	}
	
	// Loop through our gate positions to create gates at the stored positions.
	for (var i = 0; i < ds_list_size(gate_positions_closed); i++) {
        var pos = ds_list_find_value(gate_positions_closed, i);
        Place_Closed_Gate(pos[0], pos[1], room_pixel_width);
    }
	
	for (var i = 0; i < ds_list_size(gate_positions_open); i++) {
        var pos = ds_list_find_value(gate_positions_open, i);
        Place_Open_Gate(pos[0], pos[1], room_pixel_width);
    }
	
	// Delete to prevent memory leaks
    ds_list_destroy(gate_positions_closed);
	ds_list_destroy(gate_positions_open);
}
	
//Places a closed gate at the bottom of the given hallway. Used for combat room exits
function Place_Closed_Gate(gate_x, gate_y, room_pixel_width) {
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

//Places an open gate at the top of the given hallway. Used for combat room entrances
function Place_Open_Gate(gate_x, gate_y, room_pixel_width) {
    var gate_width = 448; //hardcoded... change later TODO
    //var gate_height = 32;

    // Convert grid pos to room coords and create gate instance
    var room_x = (gate_x * room_pixel_width) + (room_pixel_width / 2) - (gate_width / 2);
    var room_y = (gate_y * room_pixel_width * -1); // Make sure its negative since room "up" is negative dir.

    var inst = instance_create_layer(room_x, room_y, "Instances", obj_room_gate_open);

    if (inst == noone) {
        show_debug_message("Gate instance could not be created");
	}
	else {
		 show_debug_message("Gate Placed at: " + string(room_x) + ", " + string(room_y));
	}
}

function Connects_To_Combat_Room_Below(layout_grid, grid_x, grid_y)
{
	var current_cell = ds_grid_get(layout_grid, grid_x, grid_y);
	if (string_count("1", current_cell) > 0) 
	{ // Is a hallway
	  // Check cells below hallways for room IDs)
		var below_cell = ds_grid_get(layout_grid, grid_x, grid_y - 1);
			
		if(string_count("c3", below_cell) > 0 || string_count("c2", below_cell) > 0) //Make sure below is a combat room
		{
			//Now only need to check that the hallway has an opening on the bottom
			if(current_cell == "1v" || current_cell == "1vf")
			{
				return true;
			}
			else
			{
				var room_type_string = Choose_Hallway_Type_To_Generate(layout_grid, grid_x, grid_y);
				if(room_type_string == "ud" || room_type_string == "dr")
				{
					return true;
				}
			}
		}
	}
	return false;
}

function Connects_To_Combat_Room_Above(layout_grid, grid_x, grid_y)
{
	var current_cell = ds_grid_get(layout_grid, grid_x, grid_y);
	if (string_count("1", current_cell) > 0) 
	{ // Is a hallway
	  // Check cells below hallways for room IDs)
		var above_cell = ds_grid_get(layout_grid, grid_x, grid_y + 1);
			
		if(above_cell == "c2" || above_cell == "c3") //Make sure below is a combat room
		{
			//Now only need to check that the hallway has an opening on the bottom
			if(current_cell == "1v" || current_cell == "1vf")
			{
				return true;
			}
			else
			{
				var room_type_string = Choose_Hallway_Type_To_Generate(layout_grid, grid_x, grid_y);
				if(room_type_string == "ud" || room_type_string == "ul")
				{
					return true;
				}
			}
		}
	}
	return false;
}