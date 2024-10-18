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