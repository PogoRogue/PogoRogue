image_speed = 0;
follow_player = true;
buff = obj_player.buff_planetarybullets;
item_name = "Planetary Bullets";
item_tagline = "Spawns a bullet that circles you, dealing damage to any enemy it touches.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 35;
max_uses = 5;
item_stats = "";
scr_Buff_Stats();

if obj_player.planetary_bullets < max_uses {
	image_index = obj_player.planetary_bullets*2;
}else {
	image_index = (max_uses-1)*2;
}

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}