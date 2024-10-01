//create speech bubble
//depth = -5;
/*speechbubble_obj = instance_create_depth(x+6,bbox_top-3,depth-1,obj_speechbubble,{text_color: make_color_rgb(211,160,104),
	text_array: ["That pogo stick could use a few upgrades.","You'll need better guns than that.","Finally, a customer!","Hello."],
	lines_of_text: 4});
*/
//create speech bubble
if room = room_starting_area {
	speechbubble_obj = instance_create_depth(x-1,bbox_top-17,depth-1,obj_speechbubble,{text_color: make_color_rgb(211,160,104), 
	text_array: ["The Smith \nfamily legacy \ngoes back for \ngenerations.","My great \ngrandmother is \nactually known \nas the great \ngrandmother of \nPogosmithing.",
	"It's a shame \nthat she died \nin a tragic \nunicycling accident. \nI try to honor \nher with my work.", "I've even \nbegun taking unicycling \nlessons to make sure I \ndon't meet the \nsame fate."],
	lines_of_text: 4, 
	size2: true,
	
	parent_index: obj_pogosmith, 
	track_y: true});
}else {
	if global.phase <= 1 {
		randomize();
		var random_bubble = choose(1,2,3,4);
		random_set_seed(global.seed);
	}
	
	if global.phase = 2 {
		randomize();
		var random_bubble = choose(1,2,4,5,6);
		random_set_seed(global.seed);
	}
	
	if global.phase = 3 {
		randomize();
		var random_bubble = choose(1,4,5,6);
		random_set_seed(global.seed);
	}
	
	if random_bubble = 1 {
		speechbubble_obj = instance_create_depth(x-1,bbox_top-17,depth-1,obj_speechbubble,{text_color: make_color_rgb(211,160,104), 
		text_array: ["That pogo stick could use a few upgrades."],
		lines_of_text: 1,
	
		parent_index: obj_pogosmith});
	}else if random_bubble = 2 {
		speechbubble_obj = instance_create_depth(x-1,bbox_top-17,depth-1,obj_speechbubble,{text_color: make_color_rgb(211,160,104), 
		text_array: ["You'll need \nbetter guns \nthan that."],
		lines_of_text: 1, 
	
		parent_index: obj_pogosmith});
	}else if random_bubble = 3 {
		speechbubble_obj = instance_create_depth(x-1,bbox_top-17,depth-1,obj_speechbubble,{text_color: make_color_rgb(211,160,104), 
		text_array: ["Finally, a customer!"],
		lines_of_text: 1, 
	
		parent_index: obj_pogosmith});
	}else if random_bubble = 4 {
		speechbubble_obj = instance_create_depth(x-1,bbox_top-17,depth-1,obj_speechbubble,{text_color: make_color_rgb(211,160,104), 
		text_array: ["It wasn't like \nthis in here \nwhen I first \nset up shop..."],
		lines_of_text: 1, 
	
		parent_index: obj_pogosmith});
	}else if random_bubble = 5 {
		speechbubble_obj = instance_create_depth(x-1,bbox_top-17,depth-1,obj_speechbubble,{text_color: make_color_rgb(211,160,104), 
		text_array: ["I wasn't expecting you \nto make it \nthis far!"],
		lines_of_text: 1, 
	
		parent_index: obj_pogosmith});
	}else if random_bubble = 6 {
		speechbubble_obj = instance_create_depth(x-1,bbox_top-17,depth-1,obj_speechbubble,{text_color: make_color_rgb(211,160,104), 
		text_array: ["Hello again."],
		lines_of_text: 1, 
	
		parent_index: obj_pogosmith});
	}
}