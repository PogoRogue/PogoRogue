event_inherited();
follow_player = false;

list_of_possible_pickups = [obj_item_pickup_chargejump,obj_item_pickup_groundpound,obj_item_pickup_hatgun,
							obj_item_pickup_shieldbubble,obj_item_pickup_firedash,obj_item_pickup_jetpack,
							obj_item_pickup_slowmo, obj_item_pickup_bulletblast, obj_item_pickup_reload,
							obj_item_pickup_camera, obj_item_pickup_freeze, obj_item_pickup_frenzy,
							obj_item_pickup_target, obj_item_pickup_emergency, obj_item_pickup_blink];
random_pickup_drop = list_of_possible_pickups[irandom_range(0,array_length(list_of_possible_pickups)-1)];

pickup = obj_player.pickup_nothing;
item_name = "";
item_description = "";