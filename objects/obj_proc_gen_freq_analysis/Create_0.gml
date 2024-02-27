/// @desc Set up what's needed for layout generation, then count room frequency

combatRoom2_count = 0;
combatRoom3_count = 0;
combatRoom2_count_SA = 0;
combatRoom3_count_SA = 0;
UDHallway_count = 0;
LRHallway_count = 0;
DRHallway_count = 0;
ULHallway_count = 0;
UDHallway2_count = 0;
LRHallway2_count = 0;
UDHallway2_count_SA = 0;
LRHallway2_count_SA = 0;
//other_room_count = 0;
//other_room_count_SA = 0;

totalBlocks = 0;
totalBlocksSizeAdjusted = 0;


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
max_distance_between_rooms = 6; //Notably, this max is only concerned with height. 
max_gen_width = 12; //This is the max width. Because of some details in the proc gen,
//you are much less likely to hit this max than the height max
//Example: since max distance is 10 up 12 sideways, maximum hall length is actually 10 + 12 = 22

generate_proc_gen = true;


generate_start_room = false; //Since structure will be the exact same, just with or without a starter room,
//We use this bool to remember that we have (or haven't) already seen a start room

alarm[0] = 1;

