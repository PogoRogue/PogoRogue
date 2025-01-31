image_speed = 0;
follow_player = true;
buff = obj_player.buff_energydrink;
item_name = "能量饮料";
item_tagline = "每当你获得一颗铁心\n的时候, 获得一个可以\n反复充能的蓝心";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 35;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}