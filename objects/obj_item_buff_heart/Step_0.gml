// Inherit the parent event
event_inherited();

if obj_player.hp >= obj_player.max_hp and global.iron_proficiency = false {
	sold_out = true;
}else if obj_player.hp >= obj_player.max_hp and global.iron_proficiency = true and obj_player.armor_buff < obj_player.max_armor_buff {
	sold_out = false;
}else if obj_player.hp >= obj_player.max_hp and global.iron_proficiency = true and obj_player.armor_buff >= obj_player.max_armor_buff {
	sold_out = true;
}else {
	sold_out = false;
}