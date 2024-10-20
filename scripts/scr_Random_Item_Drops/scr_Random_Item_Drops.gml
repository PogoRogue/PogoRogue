
// @description Generates an array of random items to create as pickups for the player
// @description CALL ONLY IN CREATE EVENT
function scr_Random_Item_Drops(){
	
	var object_array = []; //Array to store objects we'll create later that we return
	//Objects are stored as [object_index, [x offset, y offset, depth offset]]
	
	heart_drop = irandom_range(1,100);
	buff_drop = irandom_range(1,100);
	weapon_drop = irandom_range(1,100);
	pickup_drop = irandom_range(1,100);
	
	//heart
	if (heart_drop <= heart_chance) and room != room_boss_1 and room != room_boss_2 and room != room_boss_3  {
		//randomize();
		var heart_type = choose(obj_item_buff_heart,obj_item_buff_heart,obj_item_buff_heart,obj_item_buff_armor,obj_item_buff_armor,obj_item_buff_armor,obj_item_buff_max_hp);
				
		var object_type = heart_type;
		
		var location = [0,4,-2];
		
		var object_values = [object_type, location]
		
		array_push(object_array, object_values);
		
		buff_chance = -1;
	}
	
	//buff
	if (buff_drop <= buff_chance) and room != room_boss_1 and room != room_boss_2 and room != room_boss_3 {
		var object_array = [];
		if created_items = false {
			var object_type = scr_Get_Rand_Buff_Object();
		
			var location = [0,4,-2];
		
			var object_values = [object_type, location]
		
			array_push(object_array, object_values);
			created_items = true;
		}
		//only one powerup per chest
		pickup_chance = -1;
		weapon_chance = -1;
		with obj_item_buff_heart {
			instance_destroy();	
		}
		with obj_item_buff_armor {
			instance_destroy();	
		}
		with obj_item_buff_max_hp {
			instance_destroy();	
		}
	}
	
	//weapon
	if (weapon_drop <= weapon_chance and (heart_drop > heart_chance)) and room != room_boss_1 and room != room_boss_2 and room != room_boss_3 {
		var object_array = [];
		
		var object_type = scr_Get_Rand_Weapon_Object();
		
		var location = [0,0,-2];
		
		var object_values = [object_type, location]
		
		array_push(object_array, object_values);
		
		//only one powerup per chest
		pickup_chance = -1;
		num_of_coins = 0;
		heart_chance = -1;
		with obj_item_buff_heart {
			//instance_destroy();	
		}
		with obj_item_buff_armor {
			instance_destroy();	
		}
		with obj_item_buff_max_hp {
			instance_destroy();	
		}
	}
	
	//pickup
	if (pickup_drop <= pickup_chance and (heart_drop > heart_chance)) and room != room_boss_1 and room != room_boss_2 and room != room_boss_3 {
		var object_array = [];
		
		var object_type = scr_Get_Rand_Pickup_Object();
		
		var location = [0,0,-2];
		
		var object_values = [object_type, location]
		
		array_push(object_array, object_values);

		num_of_coins = 0;
		heart_chance = -1;
		with obj_item_buff_heart {
			instance_destroy();	
		}
		with obj_item_buff_armor {
			instance_destroy();	
		}
		with obj_item_buff_max_hp {
			instance_destroy();	
		}
	}
	
	return object_array;
}

function Create_Item_Drops(object_array)
{
	//Objects are stored as [object_index, [x offset, y offset, depth]] in the object array
	
	//get center of enemy
	var center_x = x;
	var center_y = y - sprite_get_yoffset( sprite_index) + sprite_height / 2;
	
	for(var i = 0; i < array_length(object_array); i++)
	{
		var object_data = object_array[i];
		
		var object_to_create = object_data[0];
		var object_x = center_x + object_data[1][0];
		var object_y = center_y + object_data[1][1];
		var object_depth = depth + object_data[1][2];		
		
		var inst = instance_create_depth(object_x, object_y, object_depth, object_to_create);
		
		if room != room_boss_1 and room != room_boss_2 and room != room_boss_3 
		{
			with (inst)
			{
				follow_player = true;
			}
		}
	}	
}

function scr_Get_Rand_Buff_Object()
{
	random_set_seed(global.seed+global.passive_number);
	global.passive_number += 1;
	var list_of_possible_buffs = [obj_item_buff_lasersight, obj_item_buff_planetarybullets, obj_item_buff_dmg, 
							obj_item_buff_max_ammo, obj_item_buff_luck, obj_item_buff_pickybuyer, 
							obj_item_buff_rubberbullets, obj_item_buff_hotshells, obj_item_buff_combomaster, 
							obj_item_buff_blackfriday, obj_item_buff_triplethreat, obj_item_buff_flamingcoins, 
							obj_item_buff_combotime, obj_item_buff_sharpshooter, obj_item_buff_coinsup, 
							obj_item_buff_sharptip, obj_item_buff_experimentation, obj_item_buff_aerialassassin,
							obj_item_buff_supershield, obj_item_buff_revive, obj_item_buff_drilltipbullets,
							obj_item_buff_dualwielder, obj_item_buff_steadyhands, obj_item_buff_tightspring,
							obj_item_buff_magicianstouch, obj_item_buff_impatience, obj_item_buff_laststand,
							obj_item_buff_psychicbullets, obj_item_buff_righteousrevenge, obj_item_buff_robbery,
							obj_item_buff_recycling, obj_item_buff_juggler, obj_item_buff_invincibilityup,
							obj_item_buff_doublekill, obj_item_buff_ironproficiency, obj_item_buff_fastforward,
							obj_item_buff_paparazzi, obj_item_buff_crit, obj_item_buff_bartime,
							obj_item_buff_strongmuscles];
	random_buff_drop = list_of_possible_buffs[irandom_range(0,array_length(list_of_possible_buffs)-1)];
	return random_buff_drop;
	random_set_seed(global.seed);
}

function scr_Get_Rand_Weapon_Object()
{
	random_set_seed(global.seed+global.weapon_chest_num);
	global.weapon_chest_num += 1;
	//old list
	/*var list_of_possible_weapons = [obj_item_weapon_default,obj_item_weapon_paintball,obj_item_weapon_shotgun,
							obj_item_weapon_bubble,obj_item_weapon_burstfire,obj_item_weapon_grenade,
							obj_item_weapon_laser, obj_item_weapon_bouncyball,obj_item_weapon_missile,
							obj_item_weapon_boomerang, obj_item_weapon_starsucker, obj_item_weapon_sniper,
							obj_item_weapon_slime, obj_item_weapon_yoyo, obj_item_weapon_javelins,
							obj_item_weapon_water];*/
							
	//new list
	var list_of_possible_weapons = [obj_item_weapon_default,obj_item_weapon_paintball,obj_item_weapon_shotgun,
							obj_item_weapon_burstfire,obj_item_weapon_javelins,obj_item_weapon_puncher,
							obj_item_weapon_sixshooter, obj_item_weapon_bouncyball,obj_item_weapon_boomerang,
							obj_item_weapon_water, obj_item_weapon_machine, obj_item_weapon_grenade,
							obj_item_weapon_starsucker, obj_item_weapon_yoyo, obj_item_weapon_bubble,
							obj_item_weapon_slime, obj_item_weapon_sniper, obj_item_weapon_plasma,
							obj_item_weapon_laser, obj_item_weapon_missile];
	
	if global.phase <= 1 {
		random_weapon_drop = list_of_possible_weapons[irandom_range(0,7)];
	}else if global.phase = 2 {
		random_weapon_drop = list_of_possible_weapons[irandom_range(4,11)];
	}else {
		random_weapon_drop = list_of_possible_weapons[irandom_range(8,array_length(list_of_possible_weapons)-1)];
	}
	
	return random_weapon_drop;
	random_set_seed(global.seed);
}

function scr_Get_Rand_Pickup_Object()
{
	random_set_seed(global.seed+global.active_chest_num);
	global.active_chest_num += 1;
	var list_of_possible_pickups = [obj_item_pickup_reload, obj_item_pickup_freeze, obj_item_pickup_airbag, 
					obj_item_pickup_parachute, obj_item_pickup_chargejump, obj_item_pickup_groundpound, 
					obj_item_pickup_target, obj_item_pickup_volleyball, obj_item_pickup_grappling,
					obj_item_pickup_hatgun, obj_item_pickup_tripleshot, obj_item_pickup_emergency,
					obj_item_pickup_winners, obj_item_pickup_firedash, obj_item_pickup_blink,
					obj_item_pickup_jetpack, obj_item_pickup_bulletblast,obj_item_pickup_slowmo,
					obj_item_pickup_frenzy,obj_item_pickup_invincibility,obj_item_pickup_synergy_jolt,
					obj_item_pickup_synergy_launchpad, obj_item_pickup_synergy_megabounce, obj_item_pickup_synergy_harpoon,
					obj_item_pickup_synergy_wreckingball, obj_item_pickup_synergy_dragster, obj_item_pickup_synergy_hacker,
					obj_item_pickup_synergy_tacticalstrike, obj_item_pickup_synergy_blizzard, obj_item_pickup_synergy_pogomode];
	
	
	if global.phase <= 1 {
		random_pickup_drop = list_of_possible_pickups[irandom_range(0,7)];
	}else if global.phase = 2 {
		random_pickup_drop = list_of_possible_pickups[irandom_range(4,11)];
	}else {
		random_pickup_drop = list_of_possible_pickups[irandom_range(8,array_length(list_of_possible_pickups)-1)];
	}

	return random_pickup_drop;
	random_set_seed(global.seed);
}