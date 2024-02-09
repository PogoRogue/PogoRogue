/// @desc Set up what's needed for layout generation, then count room frequency

var combatRoom2_count = 0;
var combatRoom3_count = 0;
var combatRoom2_count_SA = 0;
var combatRoom3_count_SA = 0;
var UDHallway_count = 0;
var LRHallway_count = 0;
var DRHallway_count = 0;
var ULHallway_count = 0;
var UDHallway2_count = 0;
var LRHallway2_count = 0;
var UDHallway2_count_SA = 0;
var LRHallway2_count_SA = 0;
//var other_room_count = 0;
//var other_room_count_SA = 0;

var totalBlocks = 0;
var totalBlocksSizeAdjusted


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

///*
//Generate a few different layouts for test purposes
for(var loopInd = 0; loopInd < 1000; loopInd++)
{
	var layout = scr_Generate_Level_Layout(rooms_to_generate, max_gen_width, prebuilt_rooms, num_non_rand_rooms, 
	generate_start_room, min_distance_between_rooms, max_distance_between_rooms);
	
	var grid_height = ds_grid_height(layout);
	var grid_width = ds_grid_width(layout); 
	for(var i = 0; i < grid_width; i++)
	{
		for(var j = 0; j < grid_height; j++)
		{
			var block_to_generate = scr_Choose_Block_To_Generate(layout, i, j);
			if(block_to_generate == spr_2x2_Combat)
			{
				combatRoom2_count += 1;
				combatRoom2_count_SA += 4;
			}
			else if(block_to_generate == spr_3x3_Combat)
			{
				combatRoom3_count += 1;
				combatRoom3_count_SA += 9;
			}
			else if(block_to_generate == spr_ud1)
			{
				UDHallway_count += 1;				
			}
			else if(block_to_generate == spr_lr)
			{
				LRHallway_count += 1;
			}
			else if(block_to_generate == spr_dr1)
			{
				DRHallway_count += 1;
			}
			else if(block_to_generate == spr_ul1)
			{
				ULHallway_count += 1;
			}
			else if(block_to_generate == spr_lr_length2)
			{
				LRHallway2_count += 1;
				LRHallway2_count_SA += 2;
			}
			else if(block_to_generate == spr_ud_length2)
			{
				UDHallway2_count += 1;
				UDHallway2_count_SA += 2;
			}
			else
			{
				/*
				other_room_count += 1;
				other_room_size = sprite_get_height(block_to_generate)
				other_room_count_SA += other_room_size;*/
			}
		}
	}
}

totalBlocks = combatRoom2_count + combatRoom3_count + UDHallway_count + LRHallway_count + DRHallway_count
+ ULHallway_count + UDHallway2_count + LRHallway2_count;
	
totalBlocksSizeAdjusted = combatRoom2_count_SA + combatRoom3_count_SA + UDHallway_count + LRHallway_count + DRHallway_count
+ ULHallway_count + UDHallway2_count_SA + LRHallway2_count_SA;

var combatRoom2_freq = combatRoom2_count/totalBlocks;
var combatRoom3_freq = combatRoom3_count/totalBlocks;
var combatRoom2_freq_SA = combatRoom2_count_SA/totalBlocksSizeAdjusted;
var combatRoom3_freq_SA = combatRoom3_count_SA/totalBlocksSizeAdjusted;
var UDHallway_freq = UDHallway_count/totalBlocks;
var LRHallway_freq = LRHallway_count/totalBlocks;
var DRHallway_freq = DRHallway_count/totalBlocks;
var ULHallway_freq = ULHallway_count/totalBlocks;
var UDHallway_freq_SA = UDHallway_count/totalBlocksSizeAdjusted;
var LRHallway_freq_SA = LRHallway_count/totalBlocksSizeAdjusted;
var DRHallway_freq_SA = DRHallway_count/totalBlocksSizeAdjusted;
var ULHallway_freq_SA = ULHallway_count/totalBlocksSizeAdjusted;
var UDHallway2_freq = UDHallway2_count/totalBlocks;
var LRHallway2_freq = LRHallway2_count/totalBlocks;
var UDHallway2_freq_SA = UDHallway2_count_SA/totalBlocksSizeAdjusted;
var LRHallway2_freq_SA = LRHallway2_count_SA/totalBlocksSizeAdjusted;

show_debug_message("\n2x2 Combat Room Frequency: " + string(combatRoom2_freq) + ", Adjusted for size: " + string(combatRoom2_freq_SA) + "\n");
show_debug_message("3x3 Combat Room Frequency: " + string(combatRoom3_freq) + ", Adjusted for size: " + string(combatRoom3_freq_SA) + "\n");
show_debug_message("UD Hallway Block Frequency: " + string(UDHallway_freq) + ", Adjusted for size: " + string(UDHallway_freq_SA) + "\n");
show_debug_message("LR Hallway Block Frequency: " + string(LRHallway_freq) + ", Adjusted for size: " + string(LRHallway_freq_SA) + "\n");
show_debug_message("DR Hallway Block Frequency: " + string(DRHallway_freq) + ", Adjusted for size: " + string(DRHallway_freq_SA) + "\n");
show_debug_message("UL Hallway Block Frequency: " + string(ULHallway_freq) + ", Adjusted for size: " + string(ULHallway_freq_SA) + "\n");
show_debug_message("UD Hallway Length 2 Frequency: " + string(UDHallway2_freq) + ", Adjusted for size: " + string(UDHallway2_freq_SA) + "\n");
show_debug_message("LR Hallway Length 2 Frequency: " + string(LRHallway2_freq) + ", Adjusted for size: " + string(LRHallway2_freq_SA) + "\n");

	