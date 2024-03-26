/// @description Execute after location analysis

enemies_required = floor(total_enemies_in_region * enemy_percent_required);
show_debug_message("Gate " + string(proc_gen_tag) + " requires " + string(enemies_required) + " enemy kills");