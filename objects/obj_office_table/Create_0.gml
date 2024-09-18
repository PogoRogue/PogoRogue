/// @description Override
clutter_sprite = spr_office_table_object1;
x_pos = x;
y_pos = y;

randomize();
sprite_index = choose(spr_office_asset5,spr_office_asset6,spr_office_asset7,spr_office_asset8,spr_office_asset9);
random_set_seed(global.seed);

if sprite_index = spr_office_asset5 {
	for(i=0;i<8;i++) {
		switch(i) {
			case 0:  clutter_sprite = spr_office_table_object1; x_pos = x-48; y_pos = y-57; break;
			case 1:  clutter_sprite = spr_office_table_object2; x_pos = x-46; y_pos = y-52; break;
			case 2:  clutter_sprite = spr_office_table_object3; x_pos = x-49; y_pos = y-48; break;
			case 3:  clutter_sprite = spr_office_table_object4; x_pos = x-47; y_pos = y-42; break;
			case 4:  clutter_sprite = spr_office_table_object5; x_pos = x-27; y_pos = y-42; break;
			case 5:  clutter_sprite = spr_office_table_object6; x_pos = x; y_pos = y-57; break;
			case 6:  clutter_sprite = spr_office_table_object7; x_pos = x+25; y_pos = y-48; break;
			case 7:  clutter_sprite = spr_office_table_object8; x_pos = x+43; y_pos = y-47; break;
		}	
		instance_create_depth(x_pos,y_pos,depth-1,obj_office_clutter,{sprite_index: clutter_sprite});
	}
}

if sprite_index = spr_office_asset7 {
	for(i=0;i<3;i++) {
		switch(i) {
			case 0:  clutter_sprite = spr_office_table_object9; x_pos = x-12; y_pos = y-55; break;
			case 1:  clutter_sprite = spr_office_table_object10; x_pos = x-2; y_pos = y-41; break;
			case 2:  clutter_sprite = spr_office_table_object11; x_pos = x+10; y_pos = y-40; break;
		}	
		instance_create_depth(x_pos,y_pos,depth-1,obj_office_clutter,{sprite_index: clutter_sprite});
	}
}