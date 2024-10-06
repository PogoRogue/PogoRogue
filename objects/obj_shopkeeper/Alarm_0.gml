/// @description spawn speech bubble
if global.phase <= 1 {
	randomize();
	var random_bubble = choose(1,2,3,5,6);
	random_set_seed(global.seed);
}
if global.phase = 2 {
	randomize();
	var random_bubble = choose(1,2,4,3,7);
	random_set_seed(global.seed);
}
if global.phase = 3 {
	randomize();
	var random_bubble = choose(1,2,4,3,7);
	random_set_seed(global.seed);
}

randomize();
var random_bubble = choose(1,2,3,5,6,7);
random_set_seed(global.seed);

if random_bubble = 1 {
	speechbubble_obj = instance_create_depth(x,bbox_top-1,depth-1,obj_speechbubble,{text_color: make_color_rgb(207,138,203), 
	text_array: ["I've got a fine collection here for you today."],
	lines_of_text: 1,
	spawn_distance: 768, 
	retract_distance: 900, 
	alarm1_time: 360});
}else if random_bubble = 2 {
	speechbubble_obj = instance_create_depth(x,bbox_top-1,depth-1,obj_speechbubble,{text_color: make_color_rgb(207,138,203), 
	text_array: ["Those coins \nlook heavy. \nMind if I help \ncarry them?"],
	lines_of_text: 1,
	spawn_distance: 768, 
	retract_distance: 900, 
	alarm1_time: 360});
}else if random_bubble = 3 {
	speechbubble_obj = instance_create_depth(x,bbox_top-1,depth-1,obj_speechbubble,{text_color: make_color_rgb(207,138,203), 
	text_array: ["How's it going out there?"],
	lines_of_text: 1,
	spawn_distance: 768, 
	retract_distance: 900, 
	alarm1_time: 360});
}else if random_bubble = 4{
	speechbubble_obj = instance_create_depth(x,bbox_top-1,depth-1,obj_speechbubble,{text_color: make_color_rgb(207,138,203), 
	text_array: ["One of my favorite customers is back!"],
	lines_of_text: 1,
	spawn_distance: 768, 
	retract_distance: 900, 
	alarm1_time: 360});
}else if random_bubble = 5{
	speechbubble_obj = instance_create_depth(x,bbox_top-1,depth-1,obj_speechbubble,{text_color: make_color_rgb(207,138,203), 
	text_array: ["What will it be for you today?"],
	lines_of_text: 1,
	spawn_distance: 768, 
	retract_distance: 900, 
	alarm1_time: 360});
}else if random_bubble = 6{
	speechbubble_obj = instance_create_depth(x,bbox_top-1,depth-1,obj_speechbubble,{text_color: make_color_rgb(207,138,203), 
	text_array: ["We sell only \nthe finest \nproducts here."],
	lines_of_text: 1,
	spawn_distance: 768, 
	retract_distance: 900, 
	alarm1_time: 360});
}else if random_bubble = 7{
	speechbubble_obj = instance_create_depth(x,bbox_top-1,depth-1,obj_speechbubble,{text_color: make_color_rgb(207,138,203), 
	text_array: ["Would you like \nto know about \nour rewards \nprogram?"],
	lines_of_text: 1,
	spawn_distance: 768, 
	retract_distance: 900, 
	alarm1_time: 360});
}