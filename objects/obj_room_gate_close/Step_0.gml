/// @description Insert description here
// You can write your code in this editor

//added this in because only destroying the object on player collision might confuse the player, 
//so instead we might wanna make it invisible in the mean time
if (obj_player.enemies_killed_in_room >= enemies_required and obj_player.enemies_killed_in_room != 0 or enemies_required == 0) {
	image_alpha = 0;
}else {
	image_alpha = 1;
}