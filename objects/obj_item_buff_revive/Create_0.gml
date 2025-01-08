image_speed = 0;
follow_player = true;
buff = obj_player.buff_revive;
item_name = "复活图腾";
item_tagline = "在死亡时可让你以少量生\n命值复活, 只能用一次";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 50;
max_uses = 1;
item_stats = "";

if room = room_tutorial {
	item_name = "复活图腾";
	item_tagline = "在死亡时可让你以少量生\n命值复活, 只能用一次";
}

scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}