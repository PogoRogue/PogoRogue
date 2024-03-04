/// @description Keep track of player location and log data
var currentX = 0;
var currentY = 0;
if(instance_exists(obj_player))
{
	var player = instance_nearest(x, y, obj_player);
	currentX = player.x;
	currentY = player.y;
}

//Convert player location to grid location
grid_location = scr_Get_Grid_Coord_From_Room_Coord(currentX, currentY);

//Use grid location to get matching signature tag object
current_tag_object = ds_grid_get(signature_grid, grid_location[0], grid_location[1]);
//show_debug_message(string(currentX) + " " + string(currentY));
if(instance_exists(current_tag_object))
{
player_location_string = scr_Generate_Location_Message(current_tag_object);
}
else
{
	player_location_string = "none";
}


