/// @description Object setup

//create collision walls
scr_Create_Collision_Walls();

total_enemies_in_region = 0; //Total enemies in region, set by location analysis object
current_enemies_in_region = 0;
enemy_percent_required = 0.6; //fraction of enemies needing to be killed in a combat room to open the gate
enemies_required = 0; //Actual enemy count needing to be killed. Is updated in the alarm 0 event
depth = -9;
total_kills = 0;
kills_left = 0;

//alarm[1] = 2; //Count enemies shortly after creation