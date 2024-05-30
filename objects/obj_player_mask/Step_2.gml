/// @description check for collisions
//bounce off

parent_index = instance_nearest(x,y,obj_player);

colliding_with_ground = place_meeting(x,y,obj_ground);	
colliding_with_enemies = place_meeting(x,y,obj_enemy_parent);

if place_meeting(x-4,y,obj_ground) {
	if instance_place(x-4,y,obj_ground).x < x {
		colliding_with_ground_left = true;
	}else {
		colliding_with_ground_left = false;
	}
}else {
	colliding_with_ground_left = false;	
}
if place_meeting(x+4,y,obj_ground) {
	if instance_place(x+4,y,obj_ground).x > x {
		colliding_with_ground_right = true;
	}else {
		colliding_with_ground_right = false;
	}
}else {
	colliding_with_ground_right = false;	
}

//pretty sure commenting this out fixed some of our collision glitches, 
//but I'm leaving it in just in case it breaks something and we need it back
//if (parent_index.state != parent_index.state_bouncing) {

var prev_x = parent_index.x;
var prev_y = parent_index.y;

//bottom
if (place_meeting(x,y+parent_index.vspeed,obj_ground) and parent_index.vspeed < 0) {
	
	var _list = ds_list_create();
	var _num = instance_place_list(x,y+parent_index.vspeed,obj_ground, _list, false);
	_break3 = false;
	if _num > 0 {
	    for (var i = 0; i < _num; ++i;) {
			if instance_exists(_list[| i]) {
				if _list[| i].y < y {
					
					with _list[| i] {
						if place_meeting(x,bbox_bottom-other.parent_index.vspeed,other) and other.bbox_right > bbox_left+10 and other.bbox_left < bbox_right-10 {
							if other.parent_index.free = true {
								other.parent_index.vspeed *= -0.5;
								other._break3 = true;
								other.parent_index.dash_time = 0;
								other.top = true;
								other.alarm[1] = 3;
								if other.parent_index.state = other.parent_index.state_grappling {
									if instance_exists(other.parent_index.grappling_hook) {
										other.parent_index.grappling_hook.retract = true;
									}
									other.parent_index.state = other.parent_index.state_free;
								}
							}
						}
					}
					//
					if right_corner = false and left_corner = false and bottom_right_corner = false and bottom_left_corner = false {
						while place_meeting(x,y,_list[| i]) and bbox_right > _list[| i].bbox_left+10 and bbox_left < _list[| i].bbox_right-10 {
							parent_index.y += 1;
							y += 1;
						}
					}  //
					if _break3 = true {
						break;
					}
				}
			}
	    }
	}
	
	ds_list_destroy(_list);
}

//corners here

//right
if (place_meeting(x+parent_index.hspeed,y,obj_ground)) and parent_index.hspeed >= 0 {
	var _list = ds_list_create();
	var _num = instance_place_list(x+parent_index.hspeed,y,obj_ground, _list, true);
	_break = false;
	if _num > 0 {
	    for (var i = 0; i < _num; ++i;) {
			if instance_exists(_list[| i]) {
				if _list[| i].x > parent_index.x {
					with _list[| i] {
						if place_meeting(bbox_left-other.parent_index.hspeed,y,other) and other.bbox_top < bbox_bottom - 12 {
							other.parent_index.hspeed *= -0.35;
							other._break = true;
							other.parent_index.dash_time = 0;
							other.right = true;
							other.alarm[2] = 3;
							if other.parent_index.state = other.parent_index.state_grappling {
								if instance_exists(other.parent_index.grappling_hook) {
									other.parent_index.grappling_hook.retract = true;
								}
								other.parent_index.state = other.parent_index.state_free;
							}
						}
					}
					if right_corner = false and left_corner = false and bottom_right_corner = false and bottom_left_corner = false and top = false and active = true
					and bbox_top < _list[| i].bbox_bottom - 12 {
						while place_meeting(x,y,_list[| i]) {
							parent_index.x -= 1;
							x -= 1;
						}
					}
					if _break = true {
						break;
					}
				}
			}
	    }
	}
	
	ds_list_destroy(_list);
}

//left
if (place_meeting(x+parent_index.hspeed,y,obj_ground)) and parent_index.hspeed <= 0 {
	var _list = ds_list_create();
	var _num = instance_place_list(x+parent_index.hspeed,y,obj_ground, _list, false);
	_break2 = false;
	if _num > 0 {
	    for (var i = 0; i < _num; ++i;) {
			
			if instance_exists(_list[| i]) {
				if _list[| i].x < parent_index.x {
					with _list[| i] {
						if place_meeting(bbox_right-other.parent_index.hspeed,y,other) and other.bbox_top < bbox_bottom - 12 {
							other.parent_index.hspeed *= -0.35;
							other._break2 = true;
							other.parent_index.dash_time = 0;
							other.left = true;
							other.alarm[2] = 3;
							if other.parent_index.state = other.parent_index.state_grappling {
								if instance_exists(other.parent_index.grappling_hook) {
									other.parent_index.grappling_hook.retract = true;
								}
								other.parent_index.state = other.parent_index.state_free;
							}
						}
					}
					if right_corner = false and left_corner = false and bottom_right_corner = false and bottom_left_corner = false and top = false and active = true
					and bbox_top < _list[| i].bbox_bottom - 12 {
						while (place_meeting(x,y,_list[| i])) {
							parent_index.x += 1;
							x += 1;
						}
					}
					if _break2 = true {
						break;
					}
				}
			}
	    }
	}
	
	ds_list_destroy(_list);
}

if abs(parent_index.x - prev_x) > 16 {
	parent_index.x = prev_x;
	x  = prev_x;
	right_corner = true;
	alarm[0] = 3;
	show_debug_message("BUG FIXED X MASK");
}

if abs(parent_index.y - prev_y) > 16 {
	parent_index.y = prev_y;
	y  = prev_y;
	left_corner = true;
	alarm[0] = 3;
	show_debug_message("BUG FIXED Y MASK");
}

//right
if (place_meeting(x,y,obj_wallbutton)) and parent_index.hspeed >= 0 {
	var _list = ds_list_create();
	var _num = instance_place_list(x+parent_index.hspeed,y,obj_wallbutton, _list, true);
	_break = false;
	if _num > 0 {
	    for (var i = 0; i < _num; ++i;) {
			if instance_exists(_list[| i]) {
				if _list[| i].x > parent_index.x {
					with _list[| i] {
						if place_meeting(bbox_left,y,other) and other.bbox_top < bbox_bottom - 4 {
							other.parent_index.hspeed *= -0.35;
							other._break = true;
							other.parent_index.dash_time = 0;
							if other.parent_index.state = other.parent_index.state_grappling {
								if instance_exists(other.parent_index.grappling_hook) {
									other.parent_index.grappling_hook.retract = true;
								}
								other.parent_index.state = other.parent_index.state_free;
							}
						}
					}
					if _break = true {
						break;
					}
				}
			}
	    }
	}
	
	ds_list_destroy(_list);
}

//left
if (place_meeting(x,y,obj_wallbutton)) and parent_index.hspeed <= 0 {
	var _list = ds_list_create();
	var _num = instance_place_list(x+parent_index.hspeed,y,obj_wallbutton, _list, false);
	_break2 = false;
	if _num > 0 {
	    for (var i = 0; i < _num; ++i;) {
			
			if instance_exists(_list[| i]) {
				if _list[| i].x < parent_index.x {
					with _list[| i] {
						if place_meeting(bbox_right,y,other) and other.bbox_top < bbox_bottom - 4 {
							other.parent_index.hspeed *= -0.35;
							other._break2 = true;
							other.parent_index.dash_time = 0;
							if other.parent_index.state = other.parent_index.state_grappling {
								if instance_exists(other.parent_index.grappling_hook) {
									other.parent_index.grappling_hook.retract = true;
								}
								other.parent_index.state = other.parent_index.state_free;
							}
						}
					}
					if _break2 = true {
						break;
					}
				}
			}
	    }
	}
	
	ds_list_destroy(_list);
}

//bottom
if (place_meeting(x,y,obj_wallbutton) and parent_index.vspeed < 0) {
	
	var _list = ds_list_create();
	var _num = instance_place_list(x,y+parent_index.vspeed,obj_wallbutton, _list, false);
	_break3 = false;
	if _num > 0 {
	    for (var i = 0; i < _num; ++i;) {
			if instance_exists(_list[| i]) {
				if _list[| i].y < y {
					with _list[| i] {
						if place_meeting(x,bbox_bottom,other) and other.bbox_right > bbox_left+10 and other.bbox_left < bbox_right-10 {
							if other.parent_index.free = true {
								other.parent_index.vspeed *= -0.35;
								other._break3 = true;
								other.parent_index.dash_time = 0;
								if other.parent_index.state = other.parent_index.state_grappling {
									if instance_exists(other.parent_index.grappling_hook) {
										other.parent_index.grappling_hook.retract = true;
									}
									other.parent_index.state = other.parent_index.state_free;
								}
							}
						}
					}
					if _break3 = true {
						break;
					}
				}
			}
	    }
	}
	
	ds_list_destroy(_list);
}


/// @description set position same as parent
x = parent_index.x;
y = parent_index.y;
image_angle = parent_index.image_angle;

