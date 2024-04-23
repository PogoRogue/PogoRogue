vspeed += obj_player.grv;

if !place_meeting(x,y,obj_ground) {
	free = true;
}

if free = false {
	image_alpha = 0;	
}else {
	image_alpha = 1;
}

if place_meeting(x,y,obj_ground) and free = true or (place_meeting(x,y+vspeed,obj_ground_oneway) and vspeed > 0) and free = true {
	instance_destroy();
}

if scr_Animation_Complete() {
	instance_destroy();	
}

switch(color_index) {
	case 0: image_blend = make_color_rgb(207,138,203); break;
	case 1: image_blend = make_color_rgb(106,83,110); break;
	case 2: image_blend = make_color_rgb(75,128,202); break;
	case 3: image_blend = make_color_rgb(104,194,211); break;
	case 4: image_blend = make_color_rgb(86,123,121); break;
	case 5: image_blend = make_color_rgb(138,176,96); break;
	case 6: image_blend = make_color_rgb(237,225,158); break;
	case 7: image_blend = make_color_rgb(211,160,104); break;
	case 8: image_blend = make_color_rgb(180,82,82); break;
	case 9: image_blend = make_color_rgb(128,73,58); break;
	default: image_blend = make_color_rgb(207,138,203); break;
}
draw_set_color(c_white);