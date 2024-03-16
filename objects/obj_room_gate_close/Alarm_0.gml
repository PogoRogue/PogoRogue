/// @description Insert description here
// You can write your code in this editor

gate_tag = asset_get_tags(id, asset_object);
enemies_required = enemiesRequiredCount(gate_tag[0]) / 2; // Half the enemies in the combat room
show_debug_message(string(gate_tag[0]) + " requires " + string(enemies_required) + " enemy kills");