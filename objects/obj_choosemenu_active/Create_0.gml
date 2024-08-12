if global.phase > 1 {
	instance_destroy();	
}

depth -= 1000;

usable = true;
select = 1;
select_max = 3; //max # of rows
select_x = 1; //passives only
select_x_max = 5; //number of columns
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

scr_All_Actives_Array();
actives_array = [obj_item_pickup_reload, obj_item_pickup_freeze, obj_item_pickup_emergency, 
				obj_item_pickup_parachute, obj_item_pickup_firedash, obj_item_pickup_groundpound, 
				obj_item_pickup_hatgun, obj_item_pickup_chargejump, obj_item_pickup_shieldbubble,
				obj_item_pickup_target, obj_item_pickup_blink, obj_item_pickup_jetpack,
				obj_item_pickup_synergy_harpoon, obj_item_pickup_frenzy, obj_item_pickup_bulletblast,
				obj_item_pickup_slowmo, obj_item_pickup_grappling,obj_item_pickup_winners,
				obj_item_pickup_airbag, obj_item_pickup_invincibility];
				
select_max = array_length(actives_array);

if select_max < select_x_max { 
	select_x_max = select_max;
}
				
current_array = actives_array;

scr_All_Actives_Array();

all_pickups_costs = [];

for (i = 0; i < array_length(actives_array); i++) {
	with instance_create_depth(x,y,depth,actives_array[i]) {
		other.all_actives[other.i] = pickup;
		other.all_pickups_costs[other.i] = item_cost;
		instance_destroy();
	}
}

created_new_choosemenu = false;