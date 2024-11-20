/// @description Update values
hp = parent_index.hp;
max_hp = parent_index.max_hp;
max_max_hp = parent_index.max_max_hp;
armor_buff = parent_index.armor_buff;
max_armor_buff = parent_index.max_armor_buff;
energy_buff = parent_index.energy_buff;
max_energy_buff = parent_index.max_energy_buff;



//unlock skin
var skin = 2;
if armor_buff = 5 and (hp/8) = 10 and global.skins_unlocked_array[skin-1] = false {
	ini_open("itemsunlocked.ini");
	instance_create_depth(x,y,depth,obj_skinunlocked_popup,{skin_num: skin});
	global.skins_unlocked_array[skin-1] = true;
	ini_write_real("itemsunlocked", "skin " + string(skin), global.skins_unlocked_array[skin-1]);
	ini_close();	
}

if armor_buff = 5 and (hp/8) = 10 {
	if global.steam_api = true {
		if !steam_get_achievement("ACHIEVEMENT_NONA") {
			steam_set_achievement("ACHIEVEMENT_NONA");
		}
	}
}

//cactus mode 
if global.cactusmode = true {	
	if (hp/8) + armor_buff + energy_buff <= 3 {
		global.cactusmode_on = true;	
	}else {
		global.cactusmode_on = false;
	}
}

if global.mirrormode = true {	
	if (hp/8) + armor_buff + energy_buff <= 3 {
		global.mirrormode_on = true;	
	}else {
		global.mirrormode_on = false;
	}
}

if global.zap_used = true and global.zap_hearts_lost = -1 and obj_player.pickup_jolt.on_cooldown = false {
	if obj_player.pickups_array[0] = obj_player.pickup_jolt 
	or obj_player.pickups_array[1] = obj_player.pickup_jolt {
		obj_player.pickup_jolt.on_cooldown = true;
		obj_player.pickup_jolt.cooldown_time = obj_player.pickup_jolt.max_cooldown_time;
		global.zap_hearts_lost = 0;
		global.zap_used = false;
	}
}