follow_player = true;
buff = obj_player.buff_max_ammo;
item_name = "Ammo Up";
item_tagline = "Increases each currently equipped weapon's max ammo by 1.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 10;
max_uses = 0;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}

if obj_player.gun_1.bullets_per_bounce >= obj_player.gun_1.init_bullets_per_bounce + obj_player.gun_1.max_added_bullets
and obj_player.gun_2.bullets_per_bounce >= obj_player.gun_2.init_bullets_per_bounce + obj_player.gun_2.max_added_bullets {
	sold_out = true;
}else {
	sold_out = false;	
}