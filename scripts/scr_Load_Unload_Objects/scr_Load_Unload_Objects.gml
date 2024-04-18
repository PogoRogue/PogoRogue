function create_region_struct(_left_x, _top_y, _width, _height){
	region_struct =
	{
		left_x : _left_x,
		top_y : _top_y,
		r_width : _width,
		r_height : _height
	};
	return region_struct;
}

function update_region_struct_x(region_struct, _left_x)
{
	if(_left_x < region_struct.left_x)
	{
		region_struct.r_width = region_struct.r_width + region_struct.left_x - _left_x - 1;
		region_struct.left_x = _left_x;		
	}
	return region_struct;
}

function update_region_struct_y(region_struct, _top_y)
{
	if(_top_y < region_struct.top_y)
	{
		region_struct.r_height = region_struct.r_height + region_struct.top_y - _top_y - 1;
		region_struct.top_y = _top_y;
	}
	return region_struct;
}

function update_region_struct_width(region_struct, _right_x)
{
	if(region_struct.left_x + region_struct.r_width < _right_x)
	{
		region_struct.r_width = _right_x - region_struct.left_x - 1;
	}
	return region_struct;
}

function update_region_struct_height(region_struct, _bottom_y)
{
	if(region_struct.top_y + region_struct.r_height < _bottom_y)
	{
		region_struct.r_height = _bottom_y - region_struct.top_y - 1;
	}
	return region_struct;
}

function scr_Load_Region(region_struct){
	instance_activate_region(region_struct.left_x, region_struct.top_y, region_struct.r_width, region_struct.r_height, true);
}

function scr_Unload_Region(region_struct){
		instance_deactivate_region(region_struct.left_x, region_struct.top_y, region_struct.r_width, region_struct.r_height, true, true);	
}

function scr_Load_Grid(grid_x, grid_y){
	var room_coords = scr_Get_Room_Coord_From_Grid_Coord(grid_x, grid_y);
	var world_left_x = room_coords[0];
	var world_top_y = room_coords[1];
	var width_height = PROC_GEN_BLOCK_PIXEL_WIDTH - 2; //Remove 2 pixels from width so we don't
	//load objects bordering this grid
	
	instance_activate_region(world_left_x, world_top_y, width_height, width_height, true);
}

function scr_Unload_Grid(grid_x, grid_y){
	var room_coords = scr_Get_Room_Coord_From_Grid_Coord(grid_x, grid_y);
	var world_left_x = room_coords[0];
	var world_top_y = room_coords[1];
	var width_height = PROC_GEN_BLOCK_PIXEL_WIDTH - 2;
	//Remove 2 pixels from width so we don't unload  objects bordering this grid
	
	instance_deactivate_region(world_left_x, world_top_y, width_height, width_height, true, true);
}