//create speech bubble
depth = -5;
speechbubble_obj = instance_create_depth(x+6,bbox_top-3,depth-1,obj_speechbubble,{text_color: make_color_rgb(211,160,104),
	text_array: ["That pogo stick could use a few upgrades.","You'll need better guns than that.","Finally, a customer!","Hello."],
	lines_of_text: 4});