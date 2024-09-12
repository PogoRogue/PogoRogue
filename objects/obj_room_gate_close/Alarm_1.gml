/// @description Check conditions for gate open


show_debug_message("Checked gate condition... " + string(total_enemies_in_region - current_enemies_in_region) + "/" + string(enemies_required) + " killed.");
total_kills = total_enemies_in_region - current_enemies_in_region;
kills_left = enemies_required - total_kills;
if(current_enemies_in_region <= (total_enemies_in_region - enemies_required))
{
	//instance_destroy(self);
	if destroy = false {
		destroy = true;
		sprite_index = spr_gate_open_new;
		image_index = 1;
	}
	show_debug_message("Gate Condition Met!");
}