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
		var item_description = "你还没有发现这把武器.";
	}
	
	//special cases
	if item_name = "手雷发射器" {
		//item_name = "Grenade\nLauncher"
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
		draw_set_font(global.lana);
	
		//draw_sprite(spr_coin,0,xx-49+7,yy-105+15);
		scr_Draw_Text_Outlined(xx-50,yy-101+15,item_cost,make_color_rgb(237,225,158)); //50 - 5
	}
	
	//"Weapon" text
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_font(global.uranus);
	if weapon_num = 1 {
		scr_Draw_Text_Outlined(xx,yy-128,"武器1",c_white);
	}else if weapon_num = 2 {
		scr_Draw_Text_Outlined(xx,yy-128,"武器2",c_white);
	}else if weapon_num = 3 {
		scr_Draw_Text_Outlined(xx,yy-128,"武器3",c_white);
	}
	
	//Weapon Name
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(global.uranus);
	var white = make_color_rgb(242,240,229);
	
	scr_Draw_Text_Outlined(xx+30,yy-105,scr_Linebreak(item_name  + plus_string,16,99),c_white);
	
	//Weapon Description
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(global.lana);
	scr_Draw_Text_Outlined(xx-72,yy-80,scr_Linebreak(item_description,28,99),c_white);
	
	//Get Weapon Stats
	var line_1 = ""; //bullets per bounce
	var line_2 = ""; //damage per bullet
	var line_3 = ""; //auto fire? y/n
	var line_4 = ""; //fire rate
	var added_damage = "";
	
	if unlocked = true {
		
		line_1 = "弹容量: " + string(weapon.bullets_per_bounce);// + " (Max " + string(weapon.init_bullets_per_bounce + weapon.max_added_bullets) + ")";
	
		//special conditions
		
		if weapon._name = "量子冲天炮" or weapon._name = "等离子炮" {
			line_1 = "每次弹跳时间: " + string(weapon.bullets_per_bounce/60) + "秒";// + " (Max " + string((weapon.init_bullets_per_bounce + weapon.max_added_bullets)/60) + "s)";
		}
		
		if weapon._name = "回旋镖" {
			line_1 = "爆炸范围: " + string(weapon.bullets_per_bounce);// + " (Max " + string(weapon.init_bullets_per_bounce + weapon.max_added_bullets) + ")";
		}
		
		if weapon._name = "悠悠球" {
			line_1 = "弹容量: " + string(weapon.bullets_per_bounce);// + " (Max " + string(weapon.init_bullets_per_bounce + weapon.max_added_bullets) + ")";
		}
	
		//additional damage buff
		if global.damage_buff > 0 {
			added_damage = " + " + string(global.damage_buff);
			//special conditions
			if weapon._name = "量子冲天炮" {
				added_damage = " + " + string(global.damage_buff - (global.damage_buff * 0.9));
			}
		}else {
			added_damage = "";
		}
	
		line_2 = "单发伤害: " + string(weapon.ammo[0].damage) + added_damage;
	
		//special conditions
		if weapon._name = "量子冲天炮" { //laser
			line_2 = "每秒伤害: " + string(weapon.ammo[0].damage * 60) + added_damage;
		}else if weapon._name = "回旋镖" or weapon._name = "悠悠球" { //boomerang/yoyo
			line_2 = "单发伤害: " + string(weapon.ammo[0].damage) + added_damage;
		}else if weapon._name = "弹球枪" { //bbb
			line_2 = "单发伤害: " + string(weapon.ammo[0].damage) + "-" + string(weapon.ammo[0].damage*4) + added_damage;
		}else if weapon._name = "气球枪" { //balloon
			if weapon.level = 1 {
				line_2 = "单发伤害: " + string(weapon.ammo[0].damage) + "-8" + added_damage;
			}else if weapon.level = 2 {
				line_2 = "单发伤害: " + string(weapon.ammo[0].damage) + "-12" + added_damage;
			}else if weapon.level >= 3 {
				line_2 = "单发伤害: " + string(weapon.ammo[0].damage) + "-16" + added_damage;
			}
		}else if weapon._name = "磁力飞轮" { //disks
			line_2 = "单发伤害: " + string(weapon.ammo[0].damage) + added_damage;
		}
	
		if weapon.full_auto = true {
			var not_sixshooter = (weapon._name != "维和者"
			and weapon._name != "维和者" and weapon._name != "维和者"
			and weapon._name != "维和者" and weapon._name != "维和者"
			and weapon._name != "维和者");
			line_3 = "连射: 是";
			if weapon.ammo[0].firerate_end < 5 and not_sixshooter {
				line_4 = "射速: 极高";
			}else if weapon.ammo[0].firerate_end < 8 and not_sixshooter{
				line_4 = "射速: 高";
			}else if weapon.ammo[0].firerate_end < 15 and not_sixshooter {
				line_4 = "射速: 中";
			}else if not_sixshooter{
				if weapon._name != "脉冲步枪" { //burst
					line_4 = "射速: 低";
				}else {
					line_4 = "射速: 中";
				}
			}else {
				line_4 = "开火: 按下点射, 长按连射";
			}
		}else {
			line_3 = "连射: 否";	
			line_4 = "开火: 按下";
			if weapon._name = "标枪" or weapon._name = "等离子炮" //jav/plasma
			or weapon._name = "雪球加农炮" or weapon._name = "气球枪" { //snow/balloon
				line_4 = "开火: 按下松开";
			}else if weapon._name = "悠悠球" { //yoyo
				line_4 = "开火: 长按";
			}else if weapon._name = "量子冲天炮" { //laser
				line_4 = "开火: 长按";
			}
		}
	}else {
		var line_1 = "弹容量: ???"; //bullets per bounce
		var line_2 = "单发伤害: ???"; //damage per bullet
		var line_3 = "连射: ???"; //auto fire? y/n
		var line_4 = "射速: ???"; //fire rate	
	}
	
	//draw stats
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	scr_Draw_Text_Outlined(xx+3,yy+7+2,line_1,c_white);
	scr_Draw_Text_Outlined(xx+3,yy+31+2,line_2,c_white);
	scr_Draw_Text_Outlined(xx+3,yy+55+2,line_3,c_white);
	scr_Draw_Text_Outlined(xx+3,yy+79+2,line_4,c_white);
}