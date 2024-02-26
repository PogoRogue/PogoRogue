/// @desc Set up procedural generation variables, generate layout

// Our prebuilt rooms and their dimensions
// Room format: [width, height, room_id]
prebuilt_rooms = ds_list_create();
ds_list_add(prebuilt_rooms, [3, 3, "T"]); //First room in list is starting room T for tutorial
ds_list_add(prebuilt_rooms, [1, 1, "Sh"]); //Second room in list is shop room Sh for shop
ds_list_add(prebuilt_rooms, [1, 1, "B"]); //Third room in list is boss entry room B for boss

num_non_rand_rooms = 3; //Number of rooms we won't randomly place, all which exist at start of room list

//Random room sizes start here
ds_list_add(prebuilt_rooms, [3, 3, "c3"]); //3x3 Combat room, c stands for combat
ds_list_add(prebuilt_rooms, [2, 2, "c2"]); //2x2 Combat room


rooms_to_generate = 5; //Need: Start, Combat, Combat, Shop, Boss (room order)

//Max and min heights of hallways
min_distance_between_rooms = 2; //Go no lower than 2 for this number
max_distance_between_rooms = 7; //Notably, this max is only concerned with height. 
max_gen_width = 12; //This is the max width. Because of some details in the proc gen,
//you are much less likely to hit this max than the height max
//Example: since max distance is 8 up 14 sideways, maximum hall length is actually 10 + 14 = 22

generate_proc_gen = true;

if (global.phase == 1) {
	generate_start_room = true;
}
else {
	generate_start_room = false;
}
// generate_start_room = true; //Since structure will be the exact same, just with or without a starter room,
//We use this bool to remember that we have (or haven't) already seen a start room


//Generate a few different layouts for test purposes
//for(var loopInd = 0; loopInd < 5; loopInd++)
//{
//	layout_grid = scr_Generate_Level_Layout(rooms_to_generate, max_gen_width, prebuilt_rooms, num_non_rand_rooms, 
//	generate_start_room, min_distance_between_rooms, max_distance_between_rooms);
//	Show_Grid_In_Console(layout_grid)
//	show_debug_message("\n");
//}

//Generate the general layout of the procedural generation in text form
layout_grid = scr_Generate_Level_Layout(rooms_to_generate, max_gen_width, prebuilt_rooms, num_non_rand_rooms,
generate_start_room, min_distance_between_rooms, max_distance_between_rooms);
Show_Grid_In_Console(layout_grid)

var conduct_freq_analysis = false;
conduct_location_analysis = true;

if(conduct_freq_analysis)
{
	var inst = instance_create_depth(x,y,depth,obj_proc_gen_freq_analysis);
	with(inst)
	{
	min_distance_between_rooms = other.min_distance_between_rooms;
	max_distance_between_rooms = other.max_distance_between_rooms;
	max_gen_width = other.max_gen_width;
	}
}

//We already generated a start room, so instead generate a random combat room the next time we proc gen
generate_start_room = false;


global.debug_wall_count = 0;

//tiling layer
global.ground_layer = layer_create(-1);
global.tilemap_ground = layer_tilemap_create(global.ground_layer,-20000,-20000,tl_ground,20000,20000);