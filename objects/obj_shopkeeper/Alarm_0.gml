/// @description spawn speech bubble
speechbubble_obj = instance_create_depth(x,bbox_top-1,depth-1,obj_speechbubble,{text_color: make_color_rgb(104,194,211), 
	text_array: ["I am the shopkeeper."],
	lines_of_text: 1,
	spawn_distance: 768, 
	retract_distance: 900, 
	alarm1_time: 360});