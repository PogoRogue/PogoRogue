init_y = y;
//depth = -5;

//create speech bubble
speechbubble_obj = instance_create_depth(x-1,bbox_top-16,depth-1,obj_speechbubble,{text_color: make_color_rgb(104,194,211), 
	text_array: ["It's tough \nbeing the less \nsuccessful twin.", 
	"Sometimes I \nreally hate \nnominative \ndeterminism..."],
	lines_of_text: 2, 
	parent_index: obj_tony});