/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//create coins
if(hp <= 0) {
	with instance_create_depth(x,y,depth-1,obj_coin_spawner) {
		num_of_coins = 75;
	}
}
