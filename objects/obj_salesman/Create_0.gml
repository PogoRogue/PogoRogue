y_add = 0; //bob this amount of pixels
y_add_spd_start = 0.2; 
y_add_spd = y_add_spd_start; //bob at this speed
y_up = true; //bobbing up or down
init_y = y;
global.salesman_number += 1;
depth = -5;

//create speech bubble
speechbubble_obj = instance_create_depth(x-1,bbox_top-17,depth-1,obj_speechbubble,{text_color: make_color_rgb(138,176,96), 
	text_array: ["I am the traveling\nsalesman.","See anything you like?"],
	lines_of_text: 2, 
	
	parent_index: obj_salesman, 
	track_y: true});