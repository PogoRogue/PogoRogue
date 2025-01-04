if sprite_index = spr_corporate_asset2 and place_meeting(x,y,obj_ground)
or sprite_index = spr_corporate_asset3 and place_meeting(x,y,obj_ground) {
	randomize();
	sprite_index = choose(spr_corporate_asset1,spr_corporate_asset4,spr_corporate_asset5,spr_corporate_asset6);
	random_set_seed(global.seed);
}

if place_meeting(x,y,obj_chest) {
	instance_destroy();
}