image_speed = 0;
follow_player = true;
buff = obj_player.buff_paparazzi;
item_name = "照相机";
item_tagline = "受伤时对屏幕内所有\n敌人造成一定伤害"
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 40;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}