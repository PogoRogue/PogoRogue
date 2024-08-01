/// @description draw nametag
/*if instance_exists(speechbubble_obj) {
	if speechbubble_obj.bubble_index < 5 {
		draw_sprite(spr_salesman_nametag,0,x-(obj_camera.x-obj_camera.view_w_half),y-(obj_camera.y-obj_camera.view_h_half)-26);
	}
}else {
	draw_sprite(spr_salesman_nametag,0,x-(obj_camera.x-obj_camera.view_w_half),y-(obj_camera.y-obj_camera.view_h_half)-26);
}