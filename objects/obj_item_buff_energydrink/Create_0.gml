image_speed = 0;
follow_player = true;
buff = obj_player.buff_energydrink;
item_name = "能量饮料";
item_tagline = "每当你获得一颗铁心的时\n候, 获得一个可以反复充能\n的蓝心";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 35;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}