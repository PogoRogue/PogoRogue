if instance_number(obj_pause) > 1 {
	instance_destroy();	
}

pause = false;
pause_surf = -1;
pause_surf_buffer = -1;
paused_outside = false; //when called from another object
item_swap = false;

//game resolution
res_w = camera_get_view_width(view_camera[0])*6;
res_h = camera_get_view_height(view_camera[0])*6;

sprite_chunk_message = "Default Message";
draw_chunk_message = true;

