y_add = 0; //bob this amount of pixels
y_add_spd_start = 0.4; 
y_add_spd = y_add_spd_start; //bob at this spee
y_up = false; //bobbing up or down
init_x = x;
init_y = y;
end_x = 360;
end_y = 5392;
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

speechbubble_obj_1 = instance_create_depth(x-1,bbox_top-17,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
	text_array: ["Aha! Our latest recruit! Welcome to \nthe Pogobot \ntraining facility!",
	"My name is Andronio, but you can call me Droney.",
	"It is my duty and \nhonor to teach you \nthe art of pogo sticking.",
	"We've been stuck down here in the Factories for too long, and now it's time to bounce to the top! Yeah! \nFight the power!",
	"Anyways, I should probably teach you \nthe basics before I \nget carried away.",
	"First, let's get rid of that strange \nfloating lock above \nyour head..."],
	lines_of_text: 6, 
	parent_index: obj_drone_tutorial, 
	track_y: true,
	chars_per_line: 22,
	size2: true,
	retract_distance: 0,
	spawn_distance: 1000,
	constrain_player: true,
	bubble_num: 1});
	
speechbubble_obj_2 = instance_create_depth(x-1,bbox_top-17,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
	text_array: ["Huh. That was surprisingly easy.",
	"To tilt your pogo \nstick, move the left \njoystick sideways, or \npress A/D.",
	"To re-center yourself, press up.",
	"You can adjust your tilt speed in the Gameplay Settings. \nWhatever that means.",
	"Try bouncing around \nfor a little bit. \nWhen you're ready, \nbounce on over to the \ntop of that blue chest."],
	lines_of_text: 5, 
	parent_index: obj_drone_tutorial, 
	track_y: true,
	chars_per_line: 22,
	size2: true,
	retract_distance: 0,
	spawn_distance: 1000,
	bubble_num: 2,
	repeat_text: true,
	repeat_to_line: 2});

speechbubble_obj_3 = instance_create_depth(x-1,bbox_top-17,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
	text_array: ["You just got a pistol! It fits nicely into \none of your pogo \nstick's two weapon slots.",
	"Your weapons are your primary source of both combat and\n movement.",
	"Each weapon has a \nlimited amount of \nammo, but worry not!",
	"Every time you bounce, your ammo gets \nreloaded. Every time! \nThat's a pretty good deal.",
	"To fire your pistol, press the right trigger or spacebar.",
	"Try and get the hang of it. I'll meet you in the next room."],
	lines_of_text: 6, 
	parent_index: obj_drone_tutorial, 
	track_y: true,
	chars_per_line: 22,
	size2: true,
	retract_distance: 0,
	spawn_distance: 1000,
	bubble_num: 3,
	repeat_text: true});
	
speechbubble_obj_4 = instance_create_depth(x-1,bbox_top-17,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["Well done! Next, we'll go over another important skill: \nwall bouncing.",
"To perform a wall \nbounce, first, bounce \ntowards a wall.",
"Before you collide with it, tilt the other way and let the \nbottom of your pogo \nstick make contact.",
"It may take a while to get the hang of. Wall bouncing is what \nseparates the pogo \nmasters from the \npogo masses.",
"See if you can make it to the next room. Only then will I trust you with combat training."],
lines_of_text: 5, 
parent_index: obj_drone_tutorial, 
track_y: true,
chars_per_line: 22,
size2: true,
retract_distance: 0,
spawn_distance: 1000,
bubble_num: 4,
repeat_text: true,
repeat_to_line: 2 });

speechbubble_obj_5 = instance_create_depth(x-1,bbox_top-17,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["Aha! You're a natural! You have what it takes to begin combat training.",
"An amateur pogoer could never be \ntrusted around a \ndummy of this quality.",
"'Enemies', like this \nfine dummy right \nhere, take damage if \nthey are shot or \nbounced on.",
"You can also bounce on enemies from the side, like those magnificent wall bounces you were performing earlier.",
"Before I let you move \non, you must practice \nbeating this dummy up \nto the perfect amount \nI chose."],
lines_of_text: 5, 
parent_index: obj_drone_tutorial, 
track_y: true,
chars_per_line: 22,
size2: true,
retract_distance: 0,
spawn_distance: 1000,
bubble_num: 5,
repeat_text: true,
repeat_to_line: 3 });

speechbubble_obj_6 = instance_create_depth(x-1,bbox_top-17,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["I'm going to now share a well-kept secret \nthat only true \npogoers like you \nshould know.",
"Bouncing is not the \nonly way to reload \nyour weapon.",
"For some unknown \nreason we dare not \nquestion, these \nweapons reload \nthemselves when \nthey get a kill.",
"It's like they thirst for violence. I envy such fervor in a way...",
"Fortunately, you can \nuse this knowledge to \nperform some pretty \nsick moves. If speed's your thing, thank \nme later.",
"These cute pink guys above my head come back to life I guess. It's ethical...              ?",
"Try making it to the \nnext room using only \nthe enemies above \nyou. Don't you dare \ncheat. I'm watching!"],
lines_of_text: 7, 
parent_index: obj_drone_tutorial, 
track_y: true,
chars_per_line: 22,
size2: true,
retract_distance: 0,
spawn_distance: 1000,
bubble_num: 6,
repeat_text: true,
repeat_to_line: 1 });

speechbubble_obj_7 = instance_create_depth(x-1,bbox_top-17,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["Now we'll go over one \nof the most important \nparts of becoming a \nPogo master: your \nitem slots.",
"Passive items install new skills onto your \nsystem. Active items fit into one of your empty slots.",
"These skills can be \nused for a variety of \npurposes, and may \neven give you new \nways to move entirely.",
"Active items typically require a large amount of power to use, so \nyou might not be able \nto use it again \nwithout a cooldown.",
"Most cooldowns are \ntimed, but some \nactive items may \nrequire kills or bounces.",
"Shoot yourself up to the green chest to receive your first \nactive item."],
lines_of_text: 6, 
parent_index: obj_drone_tutorial, 
track_y: true,
chars_per_line: 22,
size2: true,
retract_distance: 0,
spawn_distance: 1000,
bubble_num: 7,
repeat_text: true,
repeat_to_line: 2 });

speechbubble_obj_8 = instance_create_depth(x-1,bbox_top-17,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["You got Fire Dash! A very powerful item, indubitably.",
"You can press the \nbutton shown below \nthe item's slot to \ntry it out.",
"You can also press the items info button \nshown below it to \nlearn more about \nan item.",],
lines_of_text: 3, 
parent_index: obj_drone_tutorial, 
track_y: true,
chars_per_line: 22,
size2: true,
retract_distance: 0,
spawn_distance: 1000,
bubble_num: 8,
repeat_text: true,
repeat_to_line: 2 });

speechbubble_obj_9 = instance_create_depth(x-1,bbox_top-17,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["Wowza! You sizzled those suckers."],
lines_of_text: 1, 
parent_index: obj_drone_tutorial, 
track_y: true,
chars_per_line: 22,
size2: true,
retract_distance: 0,
spawn_distance: 1000,
bubble_num: 9,
repeat_text: true,
repeat_to_line: 1 });

speechbubble_obj_10 = instance_create_depth(x-1,bbox_top-17,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["You got a new weapon! Try it out!",
"You can switch weapons with bumpers on \ncontroller or Q/E \non keyboard.",
"When you bounce, only\n your equipped weapon \nreloads. You need \nboth weapons full to \nmake it up!",
"Figure it out, or else you literally can't progress."],
lines_of_text: 4, 
parent_index: obj_drone_tutorial, 
track_y: true,
chars_per_line: 22,
size2: true,
retract_distance: 0,
spawn_distance: 1000,
bubble_num: 10,
repeat_text: true,
repeat_to_line: 2 });

speechbubble_obj_11 = instance_create_depth(x-1,bbox_top-17,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["Well done. You're almost ready to join the team.",
"Killing enemies before your meter expires \nincreases your combo \nand refills your meter.",
"Taking damage greatly \nreduces your combo \nmeter. Try not to \ntake damage. Many \nstruggle with this concept.",
"When you have a higher combo, enemies will drop more coins.",
"Coins can be used to purchase weapons, items, or health.",
"Speaking of, I \ncarefully hid a few \nmore items for you.",
"For your final test: you must successfully combo all those guys up there."],
lines_of_text: 7, 
parent_index: obj_drone_tutorial, 
track_y: true,
chars_per_line: 22,
size2: true,
retract_distance: 0,
spawn_distance: 1000,
bubble_num: 11,
repeat_text: true,
repeat_to_line: 2 });

speechbubble_obj_12 = instance_create_depth(x-1,bbox_top-17,depth-1,obj_speechbubble,{text_color: make_color_rgb(237,225,158), 
text_array: ["You passed the \nentrance exam. Now, \nlet's get pogoin' \nand rogoin'!"],
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

depth = -10;