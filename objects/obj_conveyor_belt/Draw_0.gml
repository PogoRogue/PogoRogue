/// @description Draw Tiles
if image_xscale > 0 {
	for(i=0;i<abs(image_xscale);i++) {
		if position_meeting(xx[i]-1,y,obj_conveyor_belt) and position_meeting(xx[i]+17,y,obj_conveyor_belt) {
			draw_sprite(spr_belts_center_right_animate,image_index,xx[i],y);	
		}else if position_meeting(xx[i]-1,y,obj_conveyor_belt) {
			draw_sprite(spr_belts_right_right_animate,image_index,xx[i],y);
		}else if position_meeting(xx[i]+17,y,obj_conveyor_belt) {
			draw_sprite(spr_belts_left_right_animate,image_index,xx[i],y);	
		}
	}
}else {
	for(i=0;i<abs(image_xscale);i++) {
		if position_meeting(xx[i]-1,y,obj_conveyor_belt) and position_meeting(xx[i]+17,y,obj_conveyor_belt) {
			draw_sprite(spr_belts_center_left_animate,image_index,xx[i],y);	
		}else if position_meeting(xx[i]-1,y,obj_conveyor_belt) {
			draw_sprite(spr_belts_right_left_animate,image_index,xx[i],y);	
		}else if position_meeting(xx[i]+17,y,obj_conveyor_belt) {
			draw_sprite(spr_belts_left_left_animate,image_index,xx[i],y);	
		}
	}
}