image_speed = 0;
follow_player = true;
buff = obj_player.buff_planetarybullets;
item_name = "呼球护卫";
item_tagline = "生成一个围着你旋转的光\n球, 对碰到的敌人造成伤害";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 35;
max_uses = 5;
item_stats = "";
index_add = 0; //declare this variable when there are multiple sprites for this item
scr_Buff_Stats();

if obj_player.planetary_bullets < max_uses {
	image_index = obj_player.planetary_bullets*2;
}else {
	image_index = (max_uses-1)*2;
}

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}