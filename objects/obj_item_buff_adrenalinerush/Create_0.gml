image_speed = 0;
follow_player = true;
buff = obj_player.buff_adrenalinerush;
item_name = "肾上腺素";
item_tagline = "受到伤害时减少【击杀冷却】";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 25;
max_uses = 3;
item_stats = "";
index_add = 0; //declare this variable when there are multiple sprites for this item

if global.adrenalinerush = 1 {
	item_tagline = "受到伤害时减少【击杀冷却】";
}else if global.adrenalinerush >= 2 {
	item_tagline = "受到伤害时减少【击杀冷却】";
}

scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}