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


rooms_to_generate = 4; //Need: Start, Combat, Shop, Boss (room order)
max_gen_width = 10;
generate_start_room = true; //Since structure will be the exact same, just with or without a starter room,
//We use this bool to remember that we have (or haven't) already seen a start room

layout_grid = scr_Generate_Level_Layout(rooms_to_generate, max_gen_width, prebuilt_rooms, num_non_rand_rooms, generate_start_room);

//tiling layer
global.ground_layer = layer_create(-1);
global.tilemap_ground = layer_tilemap_create(global.ground_layer,-20000,-20000,tl_ground,20000,20000);