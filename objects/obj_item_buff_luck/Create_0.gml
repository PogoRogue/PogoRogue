follow_player = true;
buff = obj_player.buff_luck;
item_name = "4 Leaf Clover";
item_tagline = "Increases your odds of receiving items from gray chests and items/hearts from enemies.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 25;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}