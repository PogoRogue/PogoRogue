
// Inherit the parent event
event_inherited();

spd = 1;
image_xscale = spd;
hp = 1; 
hp_max = hp;
hp_percent = (hp / hp_max) * 100;

respawn = false;
doOnce = true;
image_speed = 0;


heart_chance = 0; 
buff_chance = 0; 
pickup_chance = 0; 
weapon_chance = 0; 
drop_coins = false;
draw_hp = false;

y_spd = 0;

init_add_to_combo = add_to_combo;

alpha = 1;

sprite_index = spr_enemy_tutorial_respawn;
image_index = sprite_get_number(spr_enemy_tutorial_respawn)-1;
image_speed = -1;
spawned = false;
show_red = false;

damage = 0;
/*
//top left corner
with instance_create_depth(bbox_left,bbox_top,depth-3,obj_walltopleftcorner) {
	image_xscale = 1;
	image_yscale = 1;
}

//top right corner
with instance_create_depth(bbox_right,bbox_top,depth-3,obj_walltoprightcorner) {
	image_xscale = 1;
	image_yscale = 1;
}*/
	
if room = room_starting_area {
	depth = 400;	
}