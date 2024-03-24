/// @description Collects data on player location, and displays chunk player is currently in

signature_grid = 0; //Grid object to hold designer signatures per proc gen chunk. Grid is instantiated 
//after proc gen grid is created.

layout_grid = 0;

display_player_chunk = true;
display_minimap = true;
player_location_string = "None";

current_tag_object = 0;

alarm[0] = 1;

previous_tag_message = ""; //Use to fill in gaps where there might not be tag objects or regions
previous_region = 0;

region_enemy_count = ds_list_create(); //Keeps track of the number of enemies in each region
region_gate_objects = ds_list_create(); //Stores references to all the gates
//These values are later used for gate logic


display_progress_bar = false;
kills_left = 0;