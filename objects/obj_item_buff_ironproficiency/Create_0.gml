follow_player = true;
buff = obj_player.buff_ironproficiency;
item_name = "有备无患";
item_tagline = "在红心满时，多出来\n的红心会变成白心";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 25;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}