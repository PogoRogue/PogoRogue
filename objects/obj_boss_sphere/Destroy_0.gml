/// @description Remove bricks

// Destroy brick attached to main body
instance_destroy(obj_boss_sphere_health);

with obj_boss_brick {
	instance_destroy();
	instance_create_layer(x, y, "enemies", obj_explosion);
}
	
// Destroy all deached bricks
	
with obj_subboss_exploding {
	instance_destroy();
	instance_create_layer(x, y, "enemies", obj_explosion);
}
with obj_subboss_fly_chasing {
	instance_destroy();
	instance_create_layer(x, y, "enemies", obj_explosion);
}
with obj_subboss_shield {
	instance_destroy();
	instance_create_layer(x, y, "enemies", obj_explosion);
}
with obj_subboss_shield_isolated {
	instance_destroy();
	instance_create_layer(x, y, "enemies", obj_explosion);
}

//instance_destroy(obj_subboss_exploding);
//instance_destroy(obj_subboss_fly_chasing);
//instance_destroy(obj_subboss_shield);
instance_destroy(obj_subboss_tar);

instance_create_layer(x, y, "enemies", obj_explosion);
audio_play_sound(snd_explosion, 0, false);	

//create coins
with instance_create_depth(x,y,depth-1,obj_coin_spawner) {
	num_of_coins = 50;
}
// set active when destroy
with(obj_boss_portal) {
    is_active = true; 
}

if (room == room_boss_1) {
 instance_create_layer(128, 544, "hazards", obj_shop_door); //544
 instance_create_layer(608, 432, "hazards", obj_boss_door); //436
}


global.phase = 2;