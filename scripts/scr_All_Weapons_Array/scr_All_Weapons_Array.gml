// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_All_Weapons_Array(){
	//old list
	/*
	global.all_weapons = [obj_item_weapon_default, obj_item_weapon_paintball, obj_item_weapon_shotgun, 
					obj_item_weapon_bubble, obj_item_weapon_burstfire, obj_item_weapon_grenade, 
					obj_item_weapon_laser, obj_item_weapon_bouncyball, obj_item_weapon_missile,
					obj_item_weapon_boomerang, obj_item_weapon_starsucker, obj_item_weapon_sniper,
					obj_item_weapon_slime, obj_item_weapon_yoyo, obj_item_weapon_javelins,
					obj_item_weapon_water];*/
					
	//new list
	
	if global.phase <= 1 {
		global.all_weapons = [obj_item_weapon_default,obj_item_weapon_paintball,obj_item_weapon_shotgun,
					obj_item_weapon_burstfire,obj_item_weapon_javelins,obj_item_weapon_bouncyball,
					obj_item_weapon_grenade, obj_item_weapon_boomerang];
	}else if global.phase = 2 {
		global.all_weapons = [obj_item_weapon_default,obj_item_weapon_paintball,obj_item_weapon_shotgun,
					obj_item_weapon_burstfire,obj_item_weapon_javelins,obj_item_weapon_bouncyball,
					obj_item_weapon_grenade, obj_item_weapon_boomerang,obj_item_weapon_starsucker,
					obj_item_weapon_water, obj_item_weapon_slime, obj_item_weapon_yoyo];
	}else {
		global.all_weapons = [obj_item_weapon_default,obj_item_weapon_paintball,obj_item_weapon_shotgun,
					obj_item_weapon_burstfire,obj_item_weapon_javelins,obj_item_weapon_bouncyball,
					obj_item_weapon_grenade, obj_item_weapon_boomerang,obj_item_weapon_starsucker,
					obj_item_weapon_water, obj_item_weapon_slime, obj_item_weapon_yoyo,
					obj_item_weapon_missile, obj_item_weapon_sniper, obj_item_weapon_laser,
					obj_item_weapon_bubble];
	}
}