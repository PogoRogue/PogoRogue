image_speed = 0;
follow_player = true;
buff = obj_player.buff_drilltipbullets;
item_name = "螺旋弹头";
item_tagline = "使子弹可以穿透地面.\n（不对可弹射的弹药生效）";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 40;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}