image_speed = 0;
follow_player = true;
buff = obj_player.buff_dualwielder;
item_name = "双枪客";
item_tagline = "弹跳时将为所有武器装\n填弹药";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 45;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}