y_add = 0; //bob this amount of pixels
y_add_spd_start = 0.2; 
y_add_spd = y_add_spd_start; //bob at this speed
y_up = true; //bobbing up or down
init_y = y;
global.salesman_number += 1;
colliding = false;
//depth = -5;

speechbubble_obj = noone;

//create speech bubble
if room = room_starting_area {
	speechbubble_obj = noone;
}else {
	if global.phase <= 1 {
		randomize();
		var random_bubble = choose(1,2,7);
		random_set_seed(global.seed);
	}
	
	if global.phase = 2 {
		randomize();
		var random_bubble = choose(1,3,4,5,6);
		random_set_seed(global.seed);
	}
	
	if global.phase = 3 {
		randomize();
		var random_bubble = choose(1,3,4,5,6);
		random_set_seed(global.seed);
	}
	
	
	if random_bubble = 1 {
		speechbubble_obj = instance_create_depth(x-1,bbox_top-40,depth-1,obj_speechbubble,{text_color: make_color_rgb(138,176,96), 
		text_array: ["see anything you like?"],
		lines_of_text: 1, 
	
		parent_index: obj_salesman, 
		track_y: true});
	}else if random_bubble = 2 {
		speechbubble_obj = instance_create_depth(x-1,bbox_top-40,depth-1,obj_speechbubble,{text_color: make_color_rgb(138,176,96), 
		text_array: ["you're my first customer in \nweeks...", "haven't really \nfound my \nmarket yet."],
		lines_of_text: 2, 
	
		parent_index: obj_salesman, 
		track_y: true});
	}else if random_bubble = 3 {
		speechbubble_obj = instance_create_depth(x-1,bbox_top-40,depth-1,obj_speechbubble,{text_color: make_color_rgb(138,176,96), 
		text_array: ["had to go \nthrough a \nwhole lot to \nget this \nstuff..."],
		lines_of_text: 1, 
	
		parent_index: obj_salesman, 
		track_y: true});
	}else if random_bubble = 4 {
		speechbubble_obj = instance_create_depth(x-1,bbox_top-40,depth-1,obj_speechbubble,{text_color: make_color_rgb(138,176,96), 
		text_array: ["it's a tough life out here \nman.", "at least i have a propeller i \nguess..."],
		lines_of_text: 2, 
	
		parent_index: obj_salesman, 
		track_y: true});
	}else if random_bubble = 5 {
		speechbubble_obj = instance_create_depth(x-1,bbox_top-40,depth-1,obj_speechbubble,{text_color: make_color_rgb(138,176,96), 
		text_array: ["this is all i \nhave... please \ndon't be mad."],
		lines_of_text: 1, 
	
		parent_index: obj_salesman, 
		track_y: true});
	}else if random_bubble = 6 {
		speechbubble_obj = instance_create_depth(x-1,bbox_top-40,depth-1,obj_speechbubble,{text_color: make_color_rgb(138,176,96), 
		text_array: ["i accept tips by the way."],
		lines_of_text: 1, 
	
		parent_index: obj_salesman, 
		track_y: true});
	}
}