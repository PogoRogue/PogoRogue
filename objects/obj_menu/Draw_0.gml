/// @description dont draw
var xx = camera_get_view_width(view_camera[0])/2;
var yy = camera_get_view_height(view_camera[0])/2;
switch (select) {
	case 1: draw_sprite(spr_menu_selected_anim,frame,x,y-14 - 60); break;
	case 2: draw_sprite(spr_menu_selected_anim,frame,x,y-14 - 30); break;
	case 3: draw_sprite(spr_menu_selected_anim,frame,x,y-14); break;
	case 4: draw_sprite(spr_menu_selected_anim,frame,x,y-14 + 30); break;
	case 5: draw_sprite(spr_menu_selected_anim,frame,x,y-14 + 60); break;
	case 6: draw_sprite(spr_menu_selected_anim,frame,x,y-14 + 90); break;
	case 7: draw_sprite(spr_menu_selected_anim,frame,x,y-14 + 120); break;
}
draw_sprite(sprite_index,image_index,x,y);

//darken play button
/*
if global.tutorial_completed = false {
	if select = 1 - options_decrease {
		draw_sprite(spr_menu_tutorial_darken,0,x,y);
	}else {
		draw_sprite(spr_menu_tutorial_darken,1,x,y);
	}
}