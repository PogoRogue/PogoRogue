// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Change_Actives_Loadout(active1,active2){
	
	actives_array = [obj_item_pickup_reload, obj_item_pickup_freeze, obj_item_pickup_airbag, 
				obj_item_pickup_parachute, obj_item_pickup_chargejump, obj_item_pickup_groundpound, 
				obj_item_pickup_target, obj_item_pickup_volleyball, obj_item_pickup_grappling,
				obj_item_pickup_hatgun, obj_item_pickup_tripleshot, obj_item_pickup_emergency,
				obj_item_pickup_winners, obj_item_pickup_firedash, obj_item_pickup_blink,
				obj_item_pickup_jetpack, obj_item_pickup_bulletblast,obj_item_pickup_slowmo,
				obj_item_pickup_frenzy,obj_item_pickup_invincibility,obj_item_pickup_synergy_jolt,
				obj_item_pickup_synergy_launchpad, obj_item_pickup_synergy_megabounce, obj_item_pickup_synergy_harpoon,
				obj_item_pickup_synergy_wreckingball, obj_item_pickup_synergy_dragster, obj_item_pickup_synergy_hacker,
				obj_item_pickup_synergy_tacticalstrike, obj_item_pickup_synergy_blizzard, obj_item_pickup_synergy_pogomode];
	
	scr_All_Actives_Array();

	all_pickups_costs = [];

	for (i = 0; i < array_length(actives_array); i++) {
		with instance_create_depth(x,y,depth,actives_array[i]) {
			other.all_actives[other.i] = pickup;
			other.all_pickups_costs[other.i] = item_cost;
			instance_destroy();
			
		}
	}
	
	if instance_exists(obj_coin_spawner) {
		instance_destroy(obj_coin_spawner);
	}
	if instance_exists(obj_coin) {
		instance_destroy(obj_coin);
	}

	with obj_player {
		pickup_1 = active1;
		pickup_2 = active2;
		pickups_array = [pickup_1, pickup_2];
		global.pickup_1 = pickup_1;
		global.pickup_2 = pickup_2;
		other.pickup_1 = pickup_1;
		other.pickup_2 = pickup_2;
		global.num_of_pickups = num_of_pickups;
		var prev_cost = global.all_pickup_costs[0];
		for(i=0;i<array_length(all_pickups_array);i++) {
			if all_pickups_array[i] = active1 and active1 != obj_player.pickup_nothing {
				global.all_pickup_costs[0] = other.all_pickups_costs[i];
			}
			if all_pickups_array[i] = active2 and active2 != obj_player.pickup_nothing {
				global.all_pickup_costs[1] = other.all_pickups_costs[i];
			}
		}
	}
}