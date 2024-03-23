/// @description Object setup

//create collision walls
scr_Create_Collision_Walls();

total_enemies_in_region = 0; //Total enemies in region, set by location analysis object
current_enemies_in_region = 0;
enemy_percent_required = 0.5; //fraction of enemies needing to be killed in a combat room to open the gate
enemies_required = 0; //Actual enemy count needing to be killed. Is updated in the alarm 0 event
alarm[0] = 1; //Once enemy assets and location analysis is complete, update enemies required
depth = -9;