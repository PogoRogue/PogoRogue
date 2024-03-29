// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Create_Collision_Walls(){

	//top left corner
	with instance_create_depth(bbox_left,bbox_top,depth-3,obj_walltopleftcorner) {
		image_xscale = 1;
		image_yscale = 1;
	}

	//top right corner
	with instance_create_depth(bbox_right,bbox_top,depth-3,obj_walltoprightcorner) {
		image_xscale = 1;
		image_yscale = 1;
	}
	
	//bottom left corner
	with instance_create_depth(bbox_left,bbox_bottom,depth-3,obj_wallbottomleftcorner) {
		image_xscale = 1;
		image_yscale = 1;
	}

	//bottom right corner
	with instance_create_depth(bbox_right,bbox_bottom,depth-3,obj_wallbottomrightcorner) {
		image_xscale = 1;
		image_yscale = 1;
	}
}