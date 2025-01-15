y_add = 0; //bob this amount of pixels
y_add_spd_start = 0.3; 
y_add_spd = y_add_spd_start; //bob at this spee
y_up = false; //bobbing up or down
init_x = x;
init_y = y;
end_x = 360;
end_y = 5392+96;
timer = 0;
global.salesman_number += 1;
depth = -5;

spd = 0;
still = false;
timer = 0;

retract_current_bubble = false;

delete_speech_bubble = false;

//create speech bubble
//speechbubble_obj = noone;

speechbubble_obj_1 = instance_create_depth(x-1,bbox_top-4,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
	text_array: ["Aha! Our latest \nrecruit! Welcome to \nthe Pogobot Training \nFacility!",
	"My name is Andronio, \nbut you can call me \nDroney.",
	"It is my duty and \nhonor to teach you \nthe art of Pogo \ncombat.",
	"We've been stuck down \nhere in the Factories \nfor too long, and now \nit's time to bounce \nto the top! Yeah! \nFight the power!",
	"Wait, you don't know \nhow to use your pogo \nstick? Like, at all? \nUhhh... shoot. Okay.",
	"I guess I can't be \npicky here. I gotta \ngo grab the screen. \nBrb."],
	lines_of_text: 6, 
	parent_index: obj_drone_tutorial, 
	track_y: true,
	chars_per_line: 22,
	size2: true,
	retract_distance: 0,
	spawn_distance: 1000,
	constrain_player: true,
	bubble_num: 1,});
	
speechbubble_obj_2 = instance_create_depth(x-1,bbox_top-4,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
	text_array: ["Sorry for the wait. \nGot caught up with \nmy brother.",
	"Please see the screen \nfor a demonstration \non how to tilt and \nrecenter your \nPogo Stick.",
	"For your first test, \nlet's have you bounce \non up to this blue \nchest."],
	lines_of_text: 3, 
	parent_index: obj_drone_tutorial, 
	track_y: true,
	chars_per_line: 22,
	size2: true,
	retract_distance: 0,
	spawn_distance: 1000,
	bubble_num: 2,
	repeat_text: true,
	repeat_to_line: 2});

speechbubble_obj_3 = instance_create_depth(x-1,bbox_top-4,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
	text_array: ["You just got a Pistol! It fits nicely into \none of your Pogo \nStick's two weapon \nslots.",
	"Your weapons are your primary source of \nboth combat and\n movement.",
	"Each weapon has a \nlimited amount of \nammo, but worry not!",
	"Every time you bounce, your ammo reloads. \nEvery time! That's \na pretty good deal.",
	"Try and get the hang \nof it. I'll meet you \nin the next room."],
	lines_of_text: 5, 
	parent_index: obj_drone_tutorial, 
	track_y: true,
	chars_per_line: 22,
	size2: true,
	retract_distance: 0,
	spawn_distance: 1000,
	bubble_num: 3,
	repeat_text: true});
	
speechbubble_obj_4 = instance_create_depth(x-1,bbox_top-4,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["Up next: Wall \nbouncing! It's what \nseparates the Pogo \nMasters from the \nPogo masses.",
"It can be a bit tricky to get the hang of. \nTake a nice, long \nlook at the screen \nfor a demonstration.",
"I'll see you in the \nnext room for \ncombat training!"],
lines_of_text: 3, 
parent_index: obj_drone_tutorial, 
track_y: true,
chars_per_line: 22,
size2: true,
retract_distance: 0,
spawn_distance: 1000,
bubble_num: 4,
repeat_text: true,
repeat_to_line: 1 });

speechbubble_obj_5 = instance_create_depth(x-1,bbox_top-4,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["Aha! You're a wall \nbouncing prodigy! You \nclearly have what it \ntakes to begin combat \ntraining.",
"Enemies like this evil dummy take damage if \nthey are shot or if \nthey are are bounced on.",
"You can bounce on \nenemies from the top \nand from the side, \njust like those sick \nwall bounces you \nwere doing earlier.",
"Before I let you move \non, try beating up \nthis dummy."],
lines_of_text: 4, 
parent_index: obj_drone_tutorial, 
track_y: true,
chars_per_line: 22,
size2: true,
retract_distance: 0,
spawn_distance: 1000,
bubble_num: 5,
repeat_text: true,
repeat_to_line: 2 });

speechbubble_obj_6 = instance_create_depth(x-1,bbox_top-4,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["Want to know a \nsecret?",
"You can also reload \nyour weapons every \ntime you get a kill!",
"If speed's your thing, you can thank me later.",
"Try making it to the \nnext room using only \nthe enemies above me.",
"And don't worry, \nthose cute pink \nthings come back to \nlife I guess. It's \nethical...      ?"],
lines_of_text: 5, 
parent_index: obj_drone_tutorial, 
track_y: true,
chars_per_line: 22,
size2: true,
retract_distance: 0,
spawn_distance: 1000,
bubble_num: 6,
repeat_text: true,
repeat_to_line: 1 });

speechbubble_obj_7 = instance_create_depth(x-1,bbox_top-4,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["Up next is Active \nItems.",
"Active Items also fit \ninto your Pogo stick\n and can be activated \nwith the press of \na button.",
"They can give unique \nskills and new ways \nto move around.",
"They normally require \na large amount of \nenergy, so they'll \nneed a cooldown \nthrough time, kills, \nor even bounces!",
"Shoot yourself up to \nthe green chest to \nreceive your first \nActive Item!"],
lines_of_text: 5, 
parent_index: obj_drone_tutorial, 
track_y: true,
chars_per_line: 22,
size2: true,
retract_distance: 0,
spawn_distance: 1000,
bubble_num: 7,
repeat_text: true,
repeat_to_line: 2 });

speechbubble_obj_8 = instance_create_depth(x-1,bbox_top-4,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["Woah! Charge Jump! \nTry holding down the \nbutton on the item \nslot to try it out!",
"You can also press \nthe 'Items info:' \nbutton to learn \nmore about your items!"],
lines_of_text: 2, 
parent_index: obj_drone_tutorial, 
track_y: true,
chars_per_line: 22,
size2: true,
retract_distance: 0,
spawn_distance: 1000,
bubble_num: 8,
repeat_text: true,
repeat_to_line: 1 });

speechbubble_obj_9 = instance_create_depth(x-1,bbox_top-4,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["Wow! You sizzled those suckers.",
"Try opening that chest for a new weapon!"],
lines_of_text: 2, 
parent_index: obj_drone_tutorial, 
track_y: true,
chars_per_line: 22,
size2: true,
retract_distance: 0,
spawn_distance: 1000,
bubble_num: 9,
repeat_text: true,
repeat_to_line: 1 });

speechbubble_obj_10 = instance_create_depth(x-1,bbox_top-4,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["You got a new weapon! \nTry it out!",
"When you bounce, only\n your equipped weapon \nreloads.",
"Try using both weapons to make it to the \nnext room!"],
lines_of_text: 3, 
parent_index: obj_drone_tutorial, 
track_y: true,
chars_per_line: 22,
size2: true,
retract_distance: 0,
spawn_distance: 1000,
bubble_num: 10,
repeat_text: true,
repeat_to_line: 2 });

speechbubble_obj_11 = instance_create_depth(x-1,bbox_top-4,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["Well done! One \nlast thing: the \nCombo System.",
"When you have a \nhigher combo, enemies \nwill drop more coins, \nwhich can be used at \nthe shop.",
"Killing enemies before your combo meter \nexpires increases your combo and refills \nthe meter.",
"Taking damage reduces \nyour combo meter.",
"Earn a 5x combo for \nyour final test!"],
lines_of_text: 5, 
parent_index: obj_drone_tutorial, 
track_y: true,
chars_per_line: 22,
size2: true,
retract_distance: 0,
spawn_distance: 1000,
bubble_num: 11,
repeat_text: true,
repeat_to_line: 2 });

speechbubble_obj_12 = instance_create_depth(x-1,bbox_top-4,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["You completed \ntraining! Now, let's \nget Pogoin' and \nRogoin'!"],
lines_of_text: 1, 
parent_index: obj_drone_tutorial, 
track_y: true,
chars_per_line: 22,
size2: true,
retract_distance: 0,
spawn_distance: 1000,
bubble_num: 12,
repeat_text: false,
repeat_to_line: 1 });

current_speechbubble = -1;
speechbubble_array = [speechbubble_obj_1,speechbubble_obj_2,speechbubble_obj_3,
speechbubble_obj_4,speechbubble_obj_5,speechbubble_obj_6,
speechbubble_obj_7,speechbubble_obj_8,speechbubble_obj_9,
speechbubble_obj_10,speechbubble_obj_11,speechbubble_obj_12];

for (i=0;i<array_length(speechbubble_array);i++) {
	with obj_speechbubble {
		if bubble_num != other.current_speechbubble+1 {
			awake = false;
		}
	}
}

current_bubble_exists = true;

depth = -15;