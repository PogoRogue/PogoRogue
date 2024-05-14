/// @description Change enemies in region counter
/* moved to step event to be more instantaneous
if(proc_gen_tag != -1 && instance_exists(obj_proc_gen_location_analysis))
{
		show_debug_message("Enemy killed! +1 added, region: " + string(proc_gen_tag));		
		
		//Decrease enemy count for region
		var location_obj = instance_nearest(x,y,obj_proc_gen_location_analysis);
		with(location_obj)
		{
			var enemies_in_region = ds_list_find_value(region_enemy_count, other.proc_gen_tag);
			ds_list_set(region_enemy_count, other.proc_gen_tag, enemies_in_region - 1);
			
			//Check gate open condition
			var gate_list_val = ds_list_find_value(region_gate_objects, other.proc_gen_tag);
			if(gate_list_val != 0) //Do something only if there's a gate for this region
			{
				if(instance_exists(gate_list_val))
				{
					var enemies_in_region = ds_list_find_value(region_enemy_count, other.proc_gen_tag);
					gate_list_val.current_enemies_in_region = enemies_in_region;							
					show_debug_message(enemies_in_region);
					gate_list_val.alarm[1] = 1; //Tells the gate to check it's opening condition
				}
			}
		}
}
else {
	show_debug_message("Enemy killed! Couldn't change region enemy count");
}

global.current_enemies_killed += 1;
global.enemies_killed += 1;
scr_Save_Real("enemies_killed",global.enemies_killed);