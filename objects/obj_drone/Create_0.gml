y_add = 0; //bob this amount of pixels
y_add_spd_start = 0.3; 
y_add_spd = y_add_spd_start; //bob at this speed
y_up = true; //bobbing up or down
init_y = y;
global.salesman_number += 1;
depth = -5;

//create speech bubble
speechbubble_obj = instance_create_depth(x-1,bbox_top-17,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
	text_array: ["Droney is a real name, I \nswear!!!","I have a twin named Tony.",],
	lines_of_text: 2, 
	parent_index: obj_drone, 
	track_y: true});