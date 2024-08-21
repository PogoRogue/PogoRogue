// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_All_Actives_Array(){
	
	global.all_pickups_list = [obj_item_pickup_reload, obj_item_pickup_freeze, obj_item_pickup_emergency, 
					obj_item_pickup_parachute, obj_item_pickup_firedash, obj_item_pickup_groundpound, 
					obj_item_pickup_hatgun, obj_item_pickup_chargejump, obj_item_pickup_shieldbubble,
					obj_item_pickup_target, obj_item_pickup_blink, obj_item_pickup_jetpack,
					obj_item_pickup_synergy_harpoon, obj_item_pickup_frenzy, obj_item_pickup_bulletblast,
					obj_item_pickup_slowmo, obj_item_pickup_grappling,obj_item_pickup_winners,
					obj_item_pickup_airbag,obj_item_pickup_invincibility,obj_item_pickup_synergy_pogomode];
					
	if global.phase <= 1 and room != room_items {
		global.all_pickups = [obj_item_pickup_reload, obj_item_pickup_freeze, obj_item_pickup_emergency, 
					obj_item_pickup_parachute, obj_item_pickup_firedash, obj_item_pickup_groundpound, 
					obj_item_pickup_hatgun];
	}else if global.phase = 2 and room != room_items {
		global.all_pickups = [obj_item_pickup_firedash, obj_item_pickup_groundpound, obj_item_pickup_hatgun, 
					obj_item_pickup_chargejump, obj_item_pickup_shieldbubble, obj_item_pickup_target, 
					obj_item_pickup_blink, obj_item_pickup_jetpack];
	}else if global.phase = 3 and room != room_items {
		global.all_pickups = [obj_item_pickup_shieldbubble,obj_item_pickup_target, obj_item_pickup_blink, 
					obj_item_pickup_jetpack, obj_item_pickup_synergy_harpoon, obj_item_pickup_frenzy,
					obj_item_pickup_bulletblast,obj_item_pickup_slowmo, obj_item_pickup_grappling, 
					obj_item_pickup_winners, obj_item_pickup_airbag, obj_item_pickup_invincibility,
					obj_item_pickup_synergy_pogomode];
	}else {
		global.all_pickups = global.all_pickups_list;
	}
}