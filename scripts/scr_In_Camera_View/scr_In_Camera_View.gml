// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_In_Camera_View(leeway){
	if instance_exists(obj_camera) {
		if x > obj_camera.x - obj_camera.view_w_half - leeway and x < obj_camera.x + obj_camera.view_w_half + leeway
		and y > obj_camera.y - obj_camera.view_h_half - leeway and y < obj_camera.y + obj_camera.view_h_half + leeway {
			return true;
		}else {
			return false;	
		}
	}else {
		return false;	
	}
}