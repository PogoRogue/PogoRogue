// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Weapon_Stats(){
	
	if weapon.full_auto = true {
		autofire = "\nAutofire: Yes";
		if weapon.ammo[0].firerate_end < 5 {
			firerate = "\nFire Rate: Very High";
		}else if weapon.ammo[0].firerate_end < 8 {
			firerate = "\nFire Rate: High";
		}else if weapon.ammo[0].firerate_end < 15 {
			firerate = "\nFire Rate: Medium";
		}else {
			firerate = "\nFire Rate: Low";
		}
	}else {
		autofire = "\nAutofire: no";	
		firerate = "";
	}
	//additional damage buff
	if global.damage_buff > 0 {
		added_damage = " + " + string(obj_player.damage_buff);
	}else {
		added_damage = "";
	}
	//additional ammo buff
	if obj_player.max_ammo_buff > 0 {
		added_bullets = " + " + string(obj_player.max_ammo_buff);
	}else {
		added_bullets = "";
	}
	//full string
	item_stats = ("Bullets per bounce: " +
	string(weapon.bullets_per_bounce) + added_bullets +
	"\nDamage per bullet: " + string(weapon.ammo[0].damage) + added_damage +
	autofire + firerate);
	
	item_description = item_tagline + "\n\n" + item_stats;
}