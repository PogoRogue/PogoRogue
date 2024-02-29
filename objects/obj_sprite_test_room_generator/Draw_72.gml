if(room_started == false)
{
	scr_Convert_Layout_To_Test_Room(layout_grid);
	room_started = true;
	
		if(conduct_location_analysis)
	{
		location_analysis_obj = instance_create_depth(x, y, depth, obj_proc_gen_location_analysis);
		with(location_analysis_obj)
		{
			layout_grid = other.layout_grid;
		}
	}
}


