// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Items_Unlocked(){

	//passives
	global.passive_unlocked_1 = false;
	global.passive_unlocked_2 = false;
	global.passive_unlocked_3 = false;
	global.passive_unlocked_4 = false;
	global.passive_unlocked_5 = false;
	global.passive_unlocked_6 = false;
	global.passive_unlocked_7 = false;
	global.passive_unlocked_8 = false;
	global.passive_unlocked_9 = false;
	global.passive_unlocked_10 = false;
	global.passive_unlocked_11 = false;
	global.passive_unlocked_12 = false;
	global.passive_unlocked_13 = false;
	global.passive_unlocked_14 = false;
	global.passive_unlocked_15 = false;
	global.passive_unlocked_16 = false;
	global.passive_unlocked_17 = false;
	global.passive_unlocked_18 = false;
	global.passive_unlocked_19 = false;
	global.passive_unlocked_20 = false;
	global.passive_unlocked_21 = false;
	global.passive_unlocked_22 = false;
	global.passive_unlocked_23 = false;
	global.passive_unlocked_24 = false;
	global.passive_unlocked_25 = false;
	global.passive_unlocked_26 = false;
	global.passive_unlocked_27 = false;
	global.passive_unlocked_28 = false;
	global.passive_unlocked_29 = false;
	global.passive_unlocked_30 = false;
	global.passive_unlocked_31 = false;
	global.passive_unlocked_32 = false;
	
	global.passive_unlocked_array = [global.passive_unlocked_1,global.passive_unlocked_2,global.passive_unlocked_3,global.passive_unlocked_4,
									global.passive_unlocked_5,global.passive_unlocked_6,global.passive_unlocked_7,global.passive_unlocked_8,
									global.passive_unlocked_9,global.passive_unlocked_10,global.passive_unlocked_11,global.passive_unlocked_12,
									global.passive_unlocked_13,global.passive_unlocked_14,global.passive_unlocked_15,global.passive_unlocked_16,
									global.passive_unlocked_17,global.passive_unlocked_18,global.passive_unlocked_19,global.passive_unlocked_20,
									global.passive_unlocked_21,global.passive_unlocked_22,global.passive_unlocked_23,global.passive_unlocked_24,
									global.passive_unlocked_25,global.passive_unlocked_26,global.passive_unlocked_27,global.passive_unlocked_28,
									global.passive_unlocked_29,global.passive_unlocked_30,global.passive_unlocked_31,global.passive_unlocked_32];
	
	//actives
	global.active_unlocked_1 = false;
	global.active_unlocked_2 = false;
	global.active_unlocked_3 = false;
	global.active_unlocked_4 = false;
	global.active_unlocked_5 = false;
	global.active_unlocked_6 = false;
	global.active_unlocked_7 = false;
	global.active_unlocked_8 = false;
	global.active_unlocked_9 = false;
	global.active_unlocked_10 = false;
	global.active_unlocked_11 = false;
	global.active_unlocked_12 = false;
	global.active_unlocked_13 = false;
	global.active_unlocked_14 = false;
	global.active_unlocked_15 = false;
	global.active_unlocked_16 = false;
	
	global.active_unlocked_array = [global.active_unlocked_1,global.active_unlocked_2,global.active_unlocked_3,global.active_unlocked_4,
									global.active_unlocked_5,global.active_unlocked_6,global.active_unlocked_7,global.active_unlocked_8,
									global.active_unlocked_9,global.active_unlocked_10,global.active_unlocked_11,global.active_unlocked_12,
									global.active_unlocked_13,global.active_unlocked_14,global.active_unlocked_15,global.active_unlocked_16];
									
	//weapons
	global.weapon_unlocked_1 = false;
	global.weapon_unlocked_2 = false;
	global.weapon_unlocked_3 = false;
	global.weapon_unlocked_4 = false;
	global.weapon_unlocked_5 = false;
	global.weapon_unlocked_6 = false;
	global.weapon_unlocked_7 = false;
	global.weapon_unlocked_8 = false;
	global.weapon_unlocked_9 = false;
	global.weapon_unlocked_10 = false;
	global.weapon_unlocked_11 = false;
	global.weapon_unlocked_12 = false;
	global.weapon_unlocked_13 = false;
	global.weapon_unlocked_14 = false;
	global.weapon_unlocked_15 = false;
	global.weapon_unlocked_16 = false;
	
	global.weapon_unlocked_array = [global.weapon_unlocked_1,global.weapon_unlocked_2,global.weapon_unlocked_3,global.weapon_unlocked_4,
									global.weapon_unlocked_5,global.weapon_unlocked_6,global.weapon_unlocked_7,global.weapon_unlocked_8,
									global.weapon_unlocked_9,global.weapon_unlocked_10,global.weapon_unlocked_11,global.weapon_unlocked_12,
									global.weapon_unlocked_13,global.weapon_unlocked_14,global.weapon_unlocked_15,global.weapon_unlocked_16];
	

	//save values
	for(i = 0; i < array_length(global.passive_unlocked_array); i++) { //passives
		ini_open("itemsunlocked.ini");
		global.passive_unlocked_array[i] = ini_read_real("itemsunlocked", "passive " + string(i), global.passive_unlocked_array[i]);
		ini_write_real("itemsunlocked", "passive " + string(i), global.passive_unlocked_array[i]);
		ini_close();
	}
	for(i = 0; i < array_length(global.active_unlocked_array); i++) { //actives
		ini_open("itemsunlocked.ini");
		global.active_unlocked_array[i] = ini_read_real("itemsunlocked", "active " + string(i), global.active_unlocked_array[i]);
		ini_write_real("itemsunlocked", "active " + string(i), global.active_unlocked_array[i]);
		ini_close();
	}
	for(i = 0; i < array_length(global.weapon_unlocked_array); i++) { //weapons
		ini_open("itemsunlocked.ini");
		global.weapon_unlocked_array[i] = ini_read_real("itemsunlocked", "weapon " + string(i), global.weapon_unlocked_array[i]);
		ini_write_real("itemsunlocked", "weapon " + string(i), global.weapon_unlocked_array[i]);
		ini_close();
	}
}