if global.current_skin = skin_num {
	skin_num = 0;
	
	//skins
	bouncing_array = [spr_player_zekai,spr_player_skin1,spr_player_skin2,spr_player_skin3,spr_player_skin4,spr_player_skin5,spr_player_skin6];
	falling_array = [spr_player_zekai_falling,spr_player_skin1_falling,spr_player_skin2_falling,spr_player_skin3_falling,spr_player_skin4_falling,spr_player_skin5_falling,spr_player_skin6_falling];
	face_array = [spr_player_face,spr_player_skin1_face,spr_player_skin2_face,spr_player_skin3_face,spr_player_skin4_face,spr_player_skin5_face,spr_player_skin6_face];

	//player sprite
	player_sprite = bouncing_array[skin_num];
	falling_sprite = falling_array[skin_num];
	face_sprite = face_array[skin_num];

}