follow_player = true;
buff = obj_player.buff_bouncybullets;
item_name = "弹射弹药";
item_tagline = "使所有武器的子弹拥有\n弹射效果";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 45;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}