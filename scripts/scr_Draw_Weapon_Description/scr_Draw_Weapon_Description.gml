// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Draw_Weapon_Description(xx,yy,weapon,weapon_num,unlocked,item_cost) {
	
	if unlocked = true {
		var bg_spr_index = 1;
		var img_index = 1;
		var item_name = weapon._name;
		var item_description = weapon.tagline;
	}else {
		var bg_spr_index = 0;
		var img_index = sprite_get_number(weapon.sprite)-1;
		var item_name = "?????";
		var item_description = "This weapon has not been discovered yet.";
	}
	
	//special cases
	if item_name = "Grenade Launcher" {
		item_name = "Grenade\nLauncher"
	}
	
	//upgraded weapons
	if weapon.level = 2 {
		plus_string = "+"
	}else if weapon.level = 3 {
		plus_string = "++"
	}else if weapon.level = 4 {
		plus_string = "+++"
	}else {
		plus_string = ""
	}
	
	//slot
	draw_sprite(spr_itemmenu_weapon_slot,bg_spr_index,xx,yy);
	
	if img_index = 1 {
		img_index = 0;	
	}
	
	//sprites
	draw_sprite(weapon.sprite,img_index,xx-50,yy-104);
	
	//draw cost
	
	if unlocked = true and !instance_exists(obj_item_swap) or instance_exists(obj_item_swap) /*and global.recycling = true*/ {
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fnt_itemdescription2);
	
		//draw_sprite(spr_coin,0,xx-49+7,yy-105+15);
		scr_Draw_Text_Outlined(xx-50,yy-101+15,item_cost,make_color_rgb(237,225,158)); //50 - 5
	}
	
	//"Weapon" text
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_font(fnt_item_popup);
	if weapon_num = 1 {
		scr_Draw_Text_Outlined(xx,yy-128,"Weapon 1",c_white);
	}else if weapon_num = 2 {
		scr_Draw_Text_Outlined(xx,yy-128,"Weapon 2",c_white);
	}else if weapon_num = 3 {
		scr_Draw_Text_Outlined(xx,yy-128,"Weapon 3",c_white);
	}
	
	//Weapon Name
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_combo2);
	var white = make_color_rgb(242,240,229);
	
	scr_Draw_Text_Outlined(xx+30,yy-105,scr_Linebreak(item_name  + plus_string,16,99),c_white);
	
	//Weapon Description
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fnt_itemdescription2);
	scr_Draw_Text_Outlined(xx-72,yy-80,scr_Linebreak(item_description,28,99),c_white);
	
	//Get Weapon Stats
	var line_1 = ""; //bullets per bounce
	var line_2 = ""; //damage per bullet
	var line_3 = ""; //auto fire? y/n
	var line_4 = ""; //fire rate
	var added_damage = "";
	
	if unlocked = true {
		
		line_1 = "Bullets per bounce: " + string(weapon.bullets_per_bounce);// + " (Max " + string(weapon.init_bullets_per_bounce + weapon.max_added_bullets) + ")";
	
		//special conditions
		
		if weapon._name = "Laser Gun" or weapon._name = "Plasma Gun" {
			line_1 = "Time per bounce: " + string(weapon.bullets_per_bounce/60) + "s";// + " (Max " + string((weapon.init_bullets_per_bounce + weapon.max_added_bullets)/60) + "s)";
		}
		
		if weapon._name = "Boomerangs" {
			line_1 = "Boomerangs: " + string(weapon.bullets_per_bounce);// + " (Max " + string(weapon.init_bullets_per_bounce + weapon.max_added_bullets) + ")";
		}
		
		if weapon._name = "Missile Launcher" {
			line_1 = "Missiles per bounce: " + string(weapon.bullets_per_bounce);// + " (Max " + string(weapon.init_bullets_per_bounce + weapon.max_added_bullets) + ")";
		}
		
		if weapon._name = "Yo-yo" {
			line_1 = "Yo-yos: " + string(weapon.bullets_per_bounce);// + " (Max " + string(weapon.init_bullets_per_bounce + weapon.max_added_bullets) + ")";
		}
		
		if weapon._name = "Javelins" {
			line_1 = "Javelins per bounce: " + string(weapon.bullets_per_bounce);// + " (Max " + string(weapon.init_bullets_per_bounce + weapon.max_added_bullets) + ")";
		}
	
		//additional damage buff
		if global.damage_buff > 0 {
			added_damage = " + " + string(global.damage_buff);
			//special conditions
			if weapon._name = "Laser Gun" {
				added_damage = " + " + string(global.damage_buff - (global.damage_buff * 0.9));
			}
		}else {
			added_damage = "";
		}
	
		line_2 = "Damage per bullet: " + string(weapon.ammo[0].damage) + added_damage;
	
		//special conditions
		if weapon._name = "Laser Gun" {
			line_2 = "Damage per second: " + string(weapon.ammo[0].damage * 60) + added_damage;
		}else if weapon._name = "Boomerangs" or weapon._name = "Yo-yo" {
			line_2 = "Damage per hit: " + string(weapon.ammo[0].damage) + added_damage;
		}else if weapon._name = "Javelins" {
			line_2 = "Damage per javelin: " + string(weapon.ammo[0].damage) + "-16" + added_damage;
		}else if weapon._name = "Bouncy Ball Blaster" {
			line_2 = "Damage per bullet: " + string(weapon.ammo[0].damage) + "-" + string(weapon.ammo[0].damage*8) + added_damage;
		}else if weapon._name = "Plasma Gun" {
			line_2 = "Damage per orb: " + string(weapon.ammo[0].damage) + "-24" + added_damage;
		}
	
		if weapon.full_auto = true {
			line_3 = "Auto Fire: Yes";
			if weapon.ammo[0].firerate_end < 5 {
				line_4 = "Fire Rate: Very High";
			}else if weapon.ammo[0].firerate_end < 8 {
				line_4 = "Fire Rate: High";
			}else if weapon.ammo[0].firerate_end < 15 {
				line_4 = "Fire Rate: Medium";
			}else {
				if weapon._name != "Burst Rifle" {
					line_4 = "Fire Rate: Low";
				}else {
					line_4 = "Fire Rate: High";
				}
			}
		}else {
			line_3 = "Auto Fire: No";	
			line_4 = "Shoot: On Press";
			if weapon._name = "Javelins" or weapon._name = "Plasma Gun" {
				line_4 = "Shoot: On Release";
			}else if weapon._name = "Yo-yo" {
				line_4 = "Shoot: Press and Hold";
			}else if weapon._name = "Laser Gun" {
				line_4 = "Shoot: Press and Hold";
			}
		}
	}else {
		var line_1 = "Bullets per bounce: ???"; //bullets per bounce
		var line_2 = "Damage: ???"; //damage per bullet
		var line_3 = "Auto Fire: ???"; //auto fire? y/n
		var line_4 = "Fire Rate: ???"; //fire rate	
	}
	
	//draw stats
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	scr_Draw_Text_Outlined(xx+3,yy+7,line_1,c_white);
	scr_Draw_Text_Outlined(xx+3,yy+31,line_2,c_white);
	scr_Draw_Text_Outlined(xx+3,yy+55,line_3,c_white);
	scr_Draw_Text_Outlined(xx+3,yy+79,line_4,c_white);
}