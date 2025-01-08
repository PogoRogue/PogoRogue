image_speed = 0;
follow_player = true;
buff = obj_player.buff_supershield;
item_name = "究极护盾";
item_tagline = "你的铁心可以防止连击条\n因受伤而消耗";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 20;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}