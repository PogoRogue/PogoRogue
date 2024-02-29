if global.phase > 1 {
	instance_destroy();	
}

depth -= 1000;

usable = true;
select = 1;
select_max = 3; //max # of rows
select_x = 1; //passives only
select_x_max = 4; //number of columns
select_y = 1;
select_y_max = 4; //number of rows
select_y_added = 0; //bindings menu scrolling
passive_rows = 8;

selected_x = false;
selected_y = false;

x_gap = 72;
y_gap = 72;

select_sprite = spr_item_slot_actives;

alarm2_time = 30;
alarm3_time = 30;

alpha = 1.25;
fade_away = false;

moving_in = true;
centered = false;
spd = 16;
spd2 = 0;
spd_multiply = 1;
target_x = camera_get_view_width(view_camera[0])/2;

center_x = -(camera_get_view_width(view_camera[0])/2);
center_y = camera_get_view_height(view_camera[0])/2;

alarm[1] = 2;
				
weapons_array = [obj_item_weapon_paintball, obj_item_weapon_shotgun, obj_item_weapon_bubble, 
				obj_item_weapon_burstfire, obj_item_weapon_grenade, obj_item_weapon_laser,
				obj_item_weapon_bouncyball, obj_item_weapon_missile, obj_item_weapon_boomerang, 
				obj_item_weapon_starsucker, obj_item_weapon_sniper, obj_item_weapon_slime,
				obj_item_weapon_yoyo, obj_item_weapon_javelins];
				
select_max = array_length(weapons_array);

if select_max < select_x_max { 
	select_x_max = select_max;
}
				
current_array = weapons_array;

scr_All_Weapons_Array();

for (i = 0; i < array_length(weapons_array); i++) {
	with instance_create_depth(x,y,depth,weapons_array[i]) {
		other.all_weapons[other.i] = weapon;
		instance_destroy();
	}
}