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
	
	//I apologize in advance for this absolutely horrendous code -Isaac
	
	//shading
	if (surrounded and surrounded_corners) {
		
		var left_long = position_meeting(xx-17,yy,object) and object_get_name(instance_position(xx-17,yy,object).object_index) = object_get_name(object);
		var right_long = position_meeting(xx+tile_size+17,yy,object) and object_get_name(instance_position(xx+tile_size+17,yy,object).object_index) = object_get_name(object);
		var top_long = position_meeting(xx,yy-17,object) and object_get_name(instance_position(xx,yy-17,object).object_index) = object_get_name(object);
		var bottom_long = position_meeting(xx,yy+tile_size+17,object) and object_get_name(instance_position(xx,yy+tile_size+17,object).object_index) = object_get_name(object);
		var top_left_corner_long = position_meeting(xx-17,yy-17,object) and object_get_name(instance_position(xx-17,yy-17,object).object_index) = object_get_name(object);
		var top_right_corner_long = position_meeting(xx+tile_size+17,yy-17,object) and object_get_name(instance_position(xx+tile_size+17,yy-17,object).object_index) = object_get_name(object);
		var bottom_left_corner_long = position_meeting(xx-17,yy+tile_size+17,object) and object_get_name(instance_position(xx-17,yy+tile_size+17,object).object_index) = object_get_name(object);
		var bottom_right_corner_long = position_meeting(xx+tile_size+17,yy+tile_size+17,object) and object_get_name(instance_position(xx+tile_size+17,yy+tile_size+17,object).object_index) = object_get_name(object);
		surrounded_long = left_long and right_long and top_long and bottom_long;
		surrounded_long_corners = top_left_corner_long and top_right_corner_long and bottom_left_corner_long and bottom_right_corner_long;
		
		var top_left_corner_long2 = position_meeting(xx-17,yy-1,object) and object_get_name(instance_position(xx-17,yy-1,object).object_index) = object_get_name(object);
		var top_right_corner_long2 = position_meeting(xx+tile_size+17,yy-1,object) and object_get_name(instance_position(xx+tile_size+17,yy-1,object).object_index) = object_get_name(object);
		var bottom_left_corner_long2 = position_meeting(xx-17,yy+tile_size+1,object) and object_get_name(instance_position(xx-17,yy+tile_size+1,object).object_index) = object_get_name(object);
		var bottom_right_corner_long2 = position_meeting(xx+tile_size+17,yy+tile_size+1,object) and object_get_name(instance_position(xx+tile_size+17,yy+tile_size+1,object).object_index) = object_get_name(object);
	
		var top_left_corner_long3 = position_meeting(xx-1,yy-17,object) and object_get_name(instance_position(xx-1,yy-17,object).object_index) = object_get_name(object);
		var top_right_corner_long3 = position_meeting(xx+tile_size+1,yy-17,object) and object_get_name(instance_position(xx+tile_size+1,yy-17,object).object_index) = object_get_name(object);
		var bottom_left_corner_long3 = position_meeting(xx-1,yy+tile_size+17,object) and object_get_name(instance_position(xx-1,yy+tile_size+17,object).object_index) = object_get_name(object);
		var bottom_right_corner_long3 = position_meeting(xx+tile_size+1,yy+tile_size+17,object) and object_get_name(instance_position(xx+tile_size+1,yy+tile_size+17,object).object_index) = object_get_name(object);
		
		if surrounded_long and surrounded_long_corners 
		and top_left_corner_long2 and top_left_corner_long3
		and bottom_left_corner_long2 and bottom_left_corner_long3
		and top_right_corner_long2 and top_right_corner_long3
		and bottom_right_corner_long2 and bottom_right_corner_long3 {
			tile_frame = 2;
		}else {
			var top_left_corner_long2 = position_meeting(xx-17,yy-1,object) and object_get_name(instance_position(xx-17,yy-1,object).object_index) = object_get_name(object);
			var top_right_corner_long2 = position_meeting(xx+tile_size+17,yy-1,object) and object_get_name(instance_position(xx+tile_size+17,yy-1,object).object_index) = object_get_name(object);
			var bottom_left_corner_long2 = position_meeting(xx-17,yy+tile_size+1,object) and object_get_name(instance_position(xx-17,yy+tile_size+1,object).object_index) = object_get_name(object);
			var bottom_right_corner_long2 = position_meeting(xx+tile_size+17,yy+tile_size+1,object) and object_get_name(instance_position(xx+tile_size+17,yy+tile_size+1,object).object_index) = object_get_name(object);
	
			var top_left_corner_long3 = position_meeting(xx-1,yy-17,object) and object_get_name(instance_position(xx-1,yy-17,object).object_index) = object_get_name(object);
			var top_right_corner_long3 = position_meeting(xx+tile_size+1,yy-17,object) and object_get_name(instance_position(xx+tile_size+1,yy-17,object).object_index) = object_get_name(object);
			var bottom_left_corner_long3 = position_meeting(xx-1,yy+tile_size+17,object) and object_get_name(instance_position(xx-1,yy+tile_size+17,object).object_index) = object_get_name(object);
			var bottom_right_corner_long3 = position_meeting(xx+tile_size+1,yy+tile_size+17,object) and object_get_name(instance_position(xx+tile_size+1,yy+tile_size+17,object).object_index) = object_get_name(object);
			
			if top_long and bottom_long and right_long and !left_long and bottom_right_corner_long and top_right_corner_long and top_left_corner_long3 and bottom_left_corner_long3
			or top_long and bottom_long and right_long and !top_left_corner_long2 and bottom_right_corner_long and top_right_corner_long and top_left_corner_long3 and bottom_left_corner_long3 
			or top_long and bottom_long and right_long and !bottom_left_corner_long2 and bottom_right_corner_long and top_right_corner_long and top_left_corner_long3 and bottom_left_corner_long3 {
				tile_frame = 97;
			}else if top_long and bottom_long and !right_long and left_long and bottom_left_corner_long and top_left_corner_long and top_right_corner_long3 and bottom_right_corner_long3 
			or top_long and bottom_long and !top_right_corner_long2 and left_long and bottom_left_corner_long and top_left_corner_long and top_right_corner_long3 and bottom_right_corner_long3 
			or top_long and bottom_long and !bottom_right_corner_long2 and left_long and bottom_left_corner_long and top_left_corner_long and top_right_corner_long3 and bottom_right_corner_long3 {
				tile_frame = 99;
			}else if !top_long and bottom_long and right_long and left_long and bottom_left_corner_long and bottom_right_corner_long and top_left_corner_long2 and top_right_corner_long2 {
				tile_frame = 88;
			}else if top_long and !bottom_long and right_long and left_long and top_left_corner_long and top_right_corner_long and bottom_left_corner_long2 and bottom_right_corner_long2 {
				tile_frame = 108;
			}else if !top_right_corner_long and bottom_long and right_long and left_long {
				if !top_right_corner_long2 and bottom_left_corner_long and top_left_corner_long 
				and top_right_corner_long3 and bottom_right_corner_long3 and top_long 
				or !bottom_right_corner_long and top_right_corner_long3 and bottom_right_corner_long3 {
					tile_frame = 99;
				}else if !top_right_corner_long3 and bottom_left_corner_long and bottom_right_corner_long 
				and top_left_corner_long2 and top_right_corner_long2 
				or !top_left_corner_long and top_left_corner_long2 and top_right_corner_long2 and bottom_left_corner_long and bottom_right_corner_long {
					tile_frame = 88;
				}else if top_long and bottom_left_corner_long and bottom_left_corner_long2 and bottom_left_corner_long3 and top_left_corner_long and bottom_right_corner_long {
					tile_frame = 107;	
				}else if top_right_corner_long2 {
					if bottom_right_corner_long3 and bottom_right_corner_long2 {
						tile_frame = 83;
					}else if bottom_left_corner_long3 and bottom_left_corner_long2 and !(top_right_corner_long = false and bottom_right_corner_long = false) 
					or bottom_left_corner_long3 and bottom_left_corner_long2 and !top_left_corner_long {
						tile_frame = 85;
					}else {
						tile_frame = 34;
					}
				}else {
					tile_frame = 34;
				}
			}else if !top_left_corner_long and bottom_long and right_long and left_long {
				if !top_left_corner_long2 and bottom_right_corner_long and top_right_corner_long 
				and top_left_corner_long3 and bottom_left_corner_long3
				or !bottom_left_corner_long and top_left_corner_long3 and bottom_left_corner_long3 {
					tile_frame = 97;
				}else if !top_left_corner_long3 and bottom_left_corner_long and bottom_right_corner_long 
				and top_left_corner_long2 and top_right_corner_long2
				or !top_right_corner_long and top_left_corner_long2 and top_right_corner_long2 and bottom_left_corner_long and bottom_right_corner_long and bottom_left_corner_long and bottom_right_corner_long {
					tile_frame = 88;
				}else if top_long and bottom_right_corner_long and bottom_right_corner_long2 and bottom_right_corner_long3 and top_right_corner_long and bottom_left_corner_long {
					tile_frame = 109;
				}else if top_left_corner_long3 {
					if bottom_left_corner_long3 and bottom_left_corner_long2 {
						tile_frame = 85;
					}else if bottom_right_corner_long3 and bottom_right_corner_long2 and !(top_left_corner_long = false and bottom_left_corner_long = false) 
					or  bottom_right_corner_long3 and bottom_right_corner_long2 and !(top_right_corner_long) {
						tile_frame = 83;
					}else {
						tile_frame = 34;
					}
				}else {
					tile_frame = 34;
				}
			}else if top_long and !bottom_right_corner_long  and right_long and left_long {
				if !bottom_right_corner_long2 and bottom_left_corner_long and top_left_corner_long 
				and top_right_corner_long3 and bottom_right_corner_long3 and bottom_long 
				or !top_right_corner_long and top_right_corner_long3 and bottom_right_corner_long3 {
					tile_frame = 99;
				}else if !bottom_right_corner_long3 and top_left_corner_long and top_right_corner_long
				and bottom_left_corner_long2 and bottom_right_corner_long2
				or !bottom_left_corner_long and bottom_left_corner_long2 and bottom_right_corner_long2 and top_left_corner_long and top_right_corner_long {
					tile_frame = 108;
				}else if bottom_long and top_left_corner_long and top_left_corner_long2 and top_left_corner_long3 and bottom_left_corner_long and top_right_corner_long {
					tile_frame = 87;
				}else if top_right_corner_long3 {
					if top_left_corner_long2 and top_left_corner_long3 {
						tile_frame = 105;
					}else if top_right_corner_long2 and top_right_corner_long3 and top_left_corner_long3 {
						tile_frame = 103;
					}else {
						tile_frame = 34;
					}
				}else {
					tile_frame = 34;
				}
			}else if top_long and !bottom_left_corner_long and right_long and left_long {
				if !bottom_left_corner_long2 and bottom_right_corner_long and top_right_corner_long 
				and top_left_corner_long3 and bottom_left_corner_long3 
				or !top_left_corner_long and top_left_corner_long3 and bottom_left_corner_long3 {
					tile_frame = 97;
				}else if !bottom_left_corner_long3 and top_left_corner_long and top_right_corner_long
				and bottom_left_corner_long2 and bottom_right_corner_long2 
				or !bottom_right_corner_long and bottom_left_corner_long2 and bottom_right_corner_long2 {
					tile_frame = 108;
				}else if bottom_long and top_right_corner_long and top_right_corner_long2 and top_right_corner_long3 and bottom_right_corner_long and top_left_corner_long {
					tile_frame = 89;
				}else if top_left_corner_long3 {
					if top_right_corner_long2 and top_right_corner_long3 {
						tile_frame = 103;
					}else if top_left_corner_long2 and top_left_corner_long3 and top_right_corner_long3 {
						tile_frame = 105;
					}else {
						tile_frame = 34;
					}
				}else {
					tile_frame = 34;
				}
			}else {
				tile_frame = 34;
			}
			if !top_long and (!left_long or (!top_left_corner_long2))and bottom_long and right_long and bottom_right_corner_long
			or (!left_long or !top_left_corner_long2) and !top_right_corner_long3 and bottom_long and right_long and bottom_right_corner_long 
			or top_long and bottom_long and top_right_corner_long2 and bottom_right_corner_long and !bottom_left_corner_long /*and !top_left_corner_long*/ and !top_right_corner_long 
			or left_long and right_long and !top_long and bottom_long and !bottom_left_corner_long2 and bottom_right_corner_long2 
			or left_long and right_long and bottom_long and !top_long and !bottom_left_corner_long and bottom_left_corner_long3 and bottom_right_corner_long and top_right_corner_long 
			or !left_long and right_long and bottom_long and top_long and !top_left_corner_long3 and top_right_corner_long2 and top_right_corner_long3 and bottom_left_corner_long3 and bottom_right_corner_long3 {
				tile_frame = 83;
			}else if !top_long and (!right_long or !top_right_corner_long2) and bottom_long and left_long and bottom_left_corner_long
			or (!right_long or !top_right_corner_long2) and !top_left_corner_long3 and bottom_long and left_long and bottom_left_corner_long 
			or top_long and bottom_long and top_left_corner_long2 and bottom_left_corner_long and !bottom_right_corner_long and !top_left_corner_long// and !top_right_corner_long 
			or left_long and right_long and !top_long and bottom_long and !bottom_right_corner_long2 and bottom_left_corner_long2 
			or left_long and right_long and bottom_long and !top_long and !bottom_right_corner_long and bottom_right_corner_long3 and bottom_left_corner_long and top_left_corner_long 
			or left_long and !right_long and bottom_long and top_long and top_left_corner_long2 and top_left_corner_long3 and !top_right_corner_long3 and bottom_right_corner_long3 and bottom_left_corner_long3 {
				tile_frame = 85;
			}else if !bottom_long and (!left_long or !bottom_left_corner_long2) and top_long and right_long and top_right_corner_long
			or (!left_long or !bottom_left_corner_long2) and !bottom_right_corner_long and bottom_right_corner_long2 and top_left_corner_long3 and right_long and top_right_corner_long 
			or top_long and bottom_long and bottom_right_corner_long2 and top_right_corner_long and !bottom_left_corner_long and !top_left_corner_long and !bottom_right_corner_long
			or top_long and bottom_long and bottom_left_corner_long and top_right_corner_long and !top_left_corner_long2 and !bottom_right_corner_long3 
			or top_long and bottom_long and right_long and !left_long and !bottom_left_corner_long3 and top_left_corner_long3
			or !top_left_corner_long and top_left_corner_long3 and top_right_corner_long and left_long and top_long and !bottom_long and right_long {
				tile_frame = 103;
			}else if !bottom_long and (!right_long or !bottom_right_corner_long2) and top_long and left_long and top_left_corner_long
			or (!right_long or !bottom_right_corner_long2) and !bottom_left_corner_long and bottom_left_corner_long2 and top_right_corner_long3 and top_long and left_long and top_left_corner_long 
			or top_long and bottom_long and bottom_left_corner_long2 and top_left_corner_long and !bottom_left_corner_long and !top_right_corner_long and !bottom_right_corner_long 
			or top_long and bottom_long and bottom_right_corner_long and top_left_corner_long and !top_right_corner_long2 and !bottom_left_corner_long3 
			or top_long and bottom_long and left_long and !right_long and !bottom_right_corner_long3 and top_right_corner_long3 
			or !top_right_corner_long and top_right_corner_long3 and top_left_corner_long and left_long and top_long and !bottom_long and right_long {
				tile_frame = 105;
			}
			
			if !top_long and !top_left_corner_long2 and !top_right_corner_long2 and !top_left_corner_long2 and !top_right_corner_long3 and bottom_long and bottom_right_corner_long3 and bottom_left_corner_long3 {
				tile_frame = 34;
			}
			
			if surrounded_long and top_left_corner_long and top_left_corner_long2 and top_left_corner_long3
		    and bottom_left_corner_long and bottom_left_corner_long2 and bottom_left_corner_long3
			and !top_right_corner_long2 and top_right_corner_long3 and bottom_right_corner_long2 and bottom_right_corner_long3
			or surrounded_long and top_left_corner_long and top_left_corner_long2 and top_left_corner_long3
		    and bottom_left_corner_long and bottom_left_corner_long2 and bottom_left_corner_long3
			and top_right_corner_long2 and top_right_corner_long3 and !bottom_right_corner_long2 and bottom_right_corner_long3 {
				tile_frame = 99;
			}
			if surrounded_long and top_right_corner_long and top_right_corner_long2 and top_right_corner_long3
		    and bottom_right_corner_long and bottom_right_corner_long2 and bottom_right_corner_long3
			and !top_left_corner_long2 and top_left_corner_long3 and bottom_left_corner_long2 and bottom_left_corner_long3
			or surrounded_long and top_right_corner_long and top_right_corner_long2 and top_right_corner_long3
		    and bottom_right_corner_long and bottom_right_corner_long2 and bottom_right_corner_long3
			and top_left_corner_long2 and top_left_corner_long3 and !bottom_left_corner_long2 and bottom_left_corner_long3 {
				tile_frame = 97;
			}
		}
		
	}
	
	if !(surrounded and surrounded_corners) {
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
}