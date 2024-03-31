// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_All_Actives_Array(){
	
	global.all_pickus_list = [obj_item_pickup_firedash, obj_item_pickup_groundpound, obj_item_pickup_hatgun, 
					obj_item_pickup_chargejump, obj_item_pickup_reload, obj_item_pickup_freeze,
					obj_item_pickup_emergency, obj_item_pickup_parachute, obj_item_pickup_shieldbubble,
					obj_item_pickup_target, obj_item_pickup_blink, obj_item_pickup_jetpack,
					obj_item_pickup_camera, obj_item_pickup_frenzy, obj_item_pickup_bulletblast,
					obj_item_pickup_slowmo];
					
	if global.phase <= 1 and room != room_items {
		global.all_pickups = [obj_item_pickup_firedash, obj_item_pickup_groundpound, obj_item_pickup_hatgun, 
					obj_item_pickup_chargejump, obj_item_pickup_reload, obj_item_pickup_freeze,
					obj_item_pickup_emergency, obj_item_pickup_parachute];
	}else if global.phase = 2 and room != room_items {
		global.all_pickups = [obj_item_pickup_firedash, obj_item_pickup_groundpound, obj_item_pickup_hatgun, 
					obj_item_pickup_chargejump, obj_item_pickup_reload, obj_item_pickup_freeze,
					obj_item_pickup_emergency, obj_item_pickup_parachute, obj_item_pickup_shieldbubble,
					obj_item_pickup_target, obj_item_pickup_blink, obj_item_pickup_jetpack];
	}else {
		global.all_pickups = [obj_item_pickup_firedash, obj_item_pickup_groundpound, obj_item_pickup_hatgun, 
					obj_item_pickup_chargejump, obj_item_pickup_reload, obj_item_pickup_freeze,
					obj_item_pickup_emergency, obj_item_pickup_parachute, obj_item_pickup_shieldbubble,
					obj_item_pickup_target, obj_item_pickup_blink, obj_item_pickup_jetpack,
					obj_item_pickup_camera, obj_item_pickup_frenzy, obj_item_pickup_bulletblast,
					obj_item_pickup_slowmo];
	}
}