image_speed = 0;
follow_player = true;
buff = obj_player.buff_steadyhands;
item_name = "稳健之手";
item_tagline = "武器精准度提升";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 30;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}