/// @desc Load in the layout. Must be done in draw because of sprite editor
if(generate_proc_gen = true)
{
	scr_Convert_Layout_To_Rooms(layout_grid);
	generate_proc_gen = false;
	
	location_analysis_obj = instance_create_depth(x, y, depth, obj_proc_gen_location_analysis);
	with(location_analysis_obj)
	{
		layout_grid = other.layout_grid;
	}
}



