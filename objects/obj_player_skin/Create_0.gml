//mask_index = obj_player.mask_index;
animation_complete = false;
grv = 0.21;
shop_bouncing = false;
skin_yoffset = 0;
text_offset = 0;
colliding = false;
init_x = x;
centering = false;
rotation_speed = 4;

//skins
bouncing_array = [spr_player_zekai,spr_player_skin1,spr_player_skin2,spr_player_skin3,spr_player_skin4,spr_player_skin5,spr_player_skin6];
falling_array = [spr_player_zekai_falling,spr_player_skin1_falling,spr_player_skin2_falling,spr_player_skin3_falling,spr_player_skin4_falling,spr_player_skin5_falling,spr_player_skin6_falling];
face_array = [spr_player_face,spr_player_skin1_face,spr_player_skin2_face,spr_player_skin3_face,spr_player_skin4_face,spr_player_skin5_face,spr_player_skin6_face];

//player sprite
player_sprite = bouncing_array[skin_num];
falling_sprite = falling_array[skin_num];
face_sprite = face_array[skin_num];

state_shop = function() {
	vspeed += grv;
	
	//check for collision with ground y axis
	if (place_meeting(x,y+vspeed,obj_ground)) {
		while !(place_meeting(x,y+sign(vspeed),obj_ground)) {
			y += sign(vspeed);
		}
		shop_bouncing = true;
		speed = 0; //stop player movement while bouncing
	}
	
	if shop_bouncing = true {
		sprite_index = player_sprite; //set sprite
		//animate before bouncing
		if (floor(image_index) = sprite_get_number(sprite_index)-1) {
			animation_complete = true;
		}else if (animation_complete = false) {
			image_index += 0.75;
		}
		if scr_Animation_Complete() = true {
			speed = -6.6; //bounce speed
			direction = image_angle-90; //bounce angle
			sprite_index = player_sprite;
			image_speed = 0;
			image_index = 0; //reset animation to starting frame
			animation_complete = false;
			shop_bouncing = false;
		}
	}
}

state = state_shop;