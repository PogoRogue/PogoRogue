/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x,y,obj_player) or place_meeting(x,y,obj_player_mask)) {
	//If collision with player run animation and change to monster
	var anim_instance = instance_create_layer(x, y, "Instances", obj_changeanmition);
	anim_instance.is_transforming_to_monster = true;
    instance_destroy();
}







