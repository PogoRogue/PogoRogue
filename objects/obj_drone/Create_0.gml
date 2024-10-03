y_add = 0; //bob this amount of pixels
y_add_spd_start = 0.3; 
y_add_spd = y_add_spd_start; //bob at this speed
y_up = true; //bobbing up or down
init_y = y;
global.salesman_number += 1;
colliding = false;
//depth = -5;

//create speech bubble
speechbubble_obj = noone;/*instance_create_depth(x,bbox_top-4,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
	text_array: ["Good timing dude! I just \nfinished installing \nthe basketball \nhoops.", 
	"We should play \na game of \nP.O.G.O. \nsometime!", 
	"I have to say, being a drone \nmight give me \na bit of an \nadvantage \nthough."],
	lines_of_text: 3, 
	parent_index: obj_drone, 
	track_y: true,
	size2: true});