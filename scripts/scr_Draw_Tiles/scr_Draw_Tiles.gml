// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Draw_Tiles(xx,yy,tile_size,tileset,object){
	var left = position_meeting(xx-1,yy,object) and object_get_name(instance_position(xx-1,yy,object).object_index) = object_get_name(object);
	var right = position_meeting(xx+tile_size+1,yy,object) and object_get_name(instance_position(xx+tile_size+1,yy,object).object_index) = object_get_name(object);
	var top = position_meeting(xx,yy-1,object) and object_get_name(instance_position(xx,yy-1,object).object_index) = object_get_name(object);
	var bottom = position_meeting(xx,yy+tile_size+1,object) and object_get_name(instance_position(xx,yy+tile_size+1,object).object_index) = object_get_name(object);
	var top_left_corner = position_meeting(xx-1,yy-1,object) and object_get_name(instance_position(xx-1,yy-1,object).object_index) = object_get_name(object);
	var top_right_corner = position_meeting(xx+tile_size+1,yy-1,object) and object_get_name(instance_position(xx+tile_size+1,yy-1,object).object_index) = object_get_name(object);
	var bottom_left_corner = position_meeting(xx-1,yy+tile_size+1,object) and object_get_name(instance_position(xx-1,yy+tile_size+1,object).object_index) = object_get_name(object);
	var bottom_right_corner = position_meeting(xx+tile_size+1,yy+tile_size+1,object) and object_get_name(instance_position(xx+tile_size+1,yy+tile_size+1,object).object_index) = object_get_name(object);
	
	surrounded = left and right and top and bottom;
	surrounded_corners = top_left_corner and top_right_corner and bottom_left_corner and bottom_right_corner;
	
	if (surrounded) {
		tile_frame = 34;
	}
	
	//top left
	if (!left and right and bottom and !top) {
		tile_frame = 23;
	}
	
	//top right
	if (left and !right and bottom and !top) {
		tile_frame = 25;
	}
	
	//bottom left
	if (!left and right and !bottom and top) {
		tile_frame = 43;
	}
	
	//bottom right
	if (left and !right and !bottom and top) {
		tile_frame = 45;
	}
	
	//middle left
	if (!left and right and bottom and top) {
		tile_frame = 33;
	}
	
	//middle right
	if (left and !right and bottom and top) {
		tile_frame = 35;
	}
	
	//middle top
	if (left and right and bottom and !top) {
		tile_frame = 24;
	}
	
	//middle bottom
	if (left and right and !bottom and top) {
		tile_frame = 44;
	}
	
	//corners
	if (surrounded and !top_left_corner and bottom_left_corner) {
		tile_frame = 49;
	}
	
	if (surrounded and !top_right_corner and bottom_right_corner) {
		tile_frame = 47;
	}
	
	if (surrounded and !bottom_left_corner) {
		tile_frame = 29;
	}
	
	if (surrounded and !bottom_right_corner) {
		tile_frame = 27;
	}
	
	//middle corners
	if (surrounded and !top_left_corner and !bottom_left_corner) {
		tile_frame = 94;
	}
	
	if (surrounded and !top_right_corner and !bottom_right_corner) {
		tile_frame = 95;
	}
}