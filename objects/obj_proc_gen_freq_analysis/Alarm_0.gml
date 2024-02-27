/// @description Complete Freq Analysis

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
			if(block_to_generate == spr_2x2_Combat_Phase1)
			{
				combatRoom2_count += 1;
				combatRoom2_count_SA += 4;
			}
			else if(block_to_generate == spr_3x3_Combat_Phase1)
			{
				combatRoom3_count += 1;
				combatRoom3_count_SA += 9;
			}
			else if(block_to_generate == spr_ud1_Phase1)
			{
				UDHallway_count += 1;				
			}
			else if(block_to_generate == spr_lr_Phase1)
			{
				LRHallway_count += 1;
			}
			else if(block_to_generate == spr_dr1_Phase1)
			{
				DRHallway_count += 1;
			}
			else if(block_to_generate == spr_ul1_Phase1)
			{
				ULHallway_count += 1;
			}
			else if(block_to_generate == spr_lr_length2_Phase1)
			{
				LRHallway2_count += 1;
				LRHallway2_count_SA += 2;
			}
			else if(block_to_generate == spr_ud_length2_Phase1)
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

	






