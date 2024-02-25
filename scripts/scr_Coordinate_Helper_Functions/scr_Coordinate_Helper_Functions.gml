// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro PROC_GEN_BLOCK_PIXEL_WIDTH 512

function scr_Get_Room_Coord_From_Grid_Coord(grid_x, grid_y){
    var room_x = (grid_x * PROC_GEN_BLOCK_PIXEL_WIDTH);
    var room_y = (grid_y * PROC_GEN_BLOCK_PIXEL_WIDTH * -1);
	
	return [room_x, room_y];
}

function scr_Get_Grid_Coord_From_Room_Coord(room_x, room_y){
	var grid_x = floor(room_x/PROC_GEN_BLOCK_PIXEL_WIDTH);
	var grid_y = -1 * floor(room_y/PROC_GEN_BLOCK_PIXEL_WIDTH);
	
	return [grid_x, grid_y]
}