gen_next_block = true;
randomize();

// Our prebuilt rooms and their dimensions
// Room format: [width, height, room_id]
prebuilt_rooms = ds_list_create();
ds_list_add(prebuilt_rooms, [3, 3, "T"]); //First room in list is starting room T for tutorial
ds_list_add(prebuilt_rooms, [1, 1, "Sh"]); //Second room in list is shop room Sh for shop
ds_list_add(prebuilt_rooms, [3, 3, "B"]); //Third room in list is boss entry room B for boss

num_non_rand_rooms = 3; //Number of rooms we won't randomly place, all which exist at start of room list

//Random room sizes start here
ds_list_add(prebuilt_rooms, [3, 3, "c3"]); //3x3 Combat room, c stands for combat
ds_list_add(prebuilt_rooms, [2, 2, "c2"]); //2x2 Combat room


rooms_to_generate = 5; //Need: Start, Combat, Combat, Shop, Boss (room order)

//Max and min lengths of hallways (unimplemented)
max_distance_between_rooms = 10;
min_distance_between_rooms = 2;

max_gen_width = 12;
generate_start_room = true; //Since structure will be the exact same, just with or without a starter room,
//We use this bool to remember that we have (or haven't) already seen a start room

///*
//Generate a few different layouts for test purposes
for(var loopInd = 0; loopInd < 5; loopInd++)
{
	scr_Generate_Level_Layout(rooms_to_generate, max_gen_width, prebuilt_rooms, num_non_rand_rooms, generate_start_room);
	show_debug_message("\n");
}

//*/

layout_grid = scr_Generate_Level_Layout(rooms_to_generate, max_gen_width, prebuilt_rooms, num_non_rand_rooms, generate_start_room);

//We already generated a start room, so instead generate a random combat room the next time we proc gen
generate_start_room = false;


//tiling layer
global.ground_layer = layer_create(-1);
global.tilemap_ground = layer_tilemap_create(global.ground_layer,-20000,-20000,tl_ground,20000,20000);