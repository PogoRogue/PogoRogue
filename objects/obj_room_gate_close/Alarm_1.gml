/// @description Check conditions for gate open


show_debug_message("Checked gate condition... " + string(total_enemies_in_region - current_enemies_in_region) + "/" + string(enemies_required) + " killed.");
if(current_enemies_in_region <= (total_enemies_in_region - enemies_required))
{
	instance_create_depth(x,y,depth,obj_room_gate_open);
	instance_destroy(self);
	show_debug_message("Gate Condition Met!");
}