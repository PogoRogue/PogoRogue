spr_image_speed = 0;
follow_player = true;
buff = obj_player.buff_aura;
item_name = "Aura";
item_tagline = "Enemies in combat rooms begin with 20% less health."; //+ string(global.experimentation_coins) + " coins in return.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 35;
max_uses = 3;
item_stats = "";
index_add = 0; //declare this variable when there are multiple sprites for this item

scr_Buff_Stats();

if global.aura_num = 1 {
	item_tagline = "Enemies in combat rooms begin with 40% less health.";
}else if global.aura_num >= 2 {
	item_tagline = "Enemies in combat rooms begin with 60% less health.";
}

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}