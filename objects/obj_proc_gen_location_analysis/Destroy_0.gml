/// @description destroy data structures

if(ds_exists(signature_grid, ds_type_grid))
{
	ds_grid_destroy(signature_grid);
}
if(ds_exists(region_enemy_count, ds_type_list))
{
	ds_list_destroy(region_enemy_count);
}
if(ds_exists(region_gate_objects, ds_type_list))
{
	ds_list_destroy(region_gate_objects);
}
if(ds_exists(region_loading_list, ds_type_list))
{
	ds_list_destroy(region_loading_list);
}
if(ds_exists(region_loaded, ds_type_list))
{
	ds_list_destroy(region_loaded);
}



