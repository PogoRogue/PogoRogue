image_speed = 0;
follow_player = true;
buff = obj_player.buff_robbery;
item_name = "抢夺";
item_tagline = "用踩踏击杀敌人时获得\n更多金币";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 35;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}