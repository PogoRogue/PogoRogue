/// @description draw self
if state != state_blink and obj_player.state != obj_player.state_strike{
	
if(current_iframes >= num_iframes - 10 and bubble = false || dead) {
	shader_set(sh_tint_red);
}

if (!dead) {
	if bubble = false {
		image_alpha = abs(cos(current_iframes / 5)) + 0.2;
	}else {
		image_alpha = 1;
	}
}else {
	image_alpha = 1;
}

//draw jetpack
if pickups_array[0] = pickup_jetpack or pickups_array[1] = pickup_jetpack {
	if sprite_index = player_sprite {
		draw_sprite_ext(spr_jetpack,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}else if sprite_index = falling_sprite {
		draw_sprite_ext(spr_jetpack,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}else if sprite_index = charging_sprite {
		draw_sprite_ext(spr_jetpack_charging,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}else if sprite_index = portal_sprite and image_xscale > 0.1 and image_yscale > 0.1 {
		draw_sprite_ext(spr_player_zekai_portal_jetpack,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}else if sprite_index = body_sprite  {
		draw_sprite_ext(spr_player_jetpack_body,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}
}

//freeze
if state = state_freeze {
	draw_sprite_ext(spr_freezeanimation,sprite_get_number(spr_freezeanimation)-1-(freeze_time/2),x+lengthdir_x(22,freeze_angle+90),y+lengthdir_y(22,freeze_angle+90),1,1,freeze_angle,c_white,freeze_alpha);	
}else {
	if (freeze_alpha > 0) {
		freeze_alpha -= 0.1;	
		draw_sprite_ext(spr_freezeanimation,sprite_get_number(spr_freezeanimation)-1,x+lengthdir_x(22,freeze_angle+90),y+lengthdir_y(22,freeze_angle+90),1,1,freeze_angle,c_white,freeze_alpha);
	}
}

if abs(image_xscale) > 0.1 and abs(image_yscale) > 0.1 {
	draw_self();
}

//draw charge bar
if (state = state_chargejump) {
	draw_sprite_general(spr_chargebar,0,0,0,sprite_get_width(spr_chargebar),sprite_get_height(spr_chargebar),x+(lengthdir_x(16,image_angle)*image_xscale),y+(lengthdir_y(16,image_angle)*image_xscale),image_xscale,-1,image_angle,c_white,c_white,c_white,c_white,1);
	draw_sprite_general(spr_chargebar_color,0,0,0,sprite_get_width(spr_chargebar_color),sprite_get_height(spr_chargebar_color)*(charge/charge_max),x+(lengthdir_x(16,image_angle)*image_xscale),y+(lengthdir_y(16,image_angle)*image_xscale),image_xscale,-1,image_angle,c_white,c_white,c_white,c_white,1);
	draw_sprite_ext(red_sprite,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,(charge/charge_max)*0.6 + 0.1);
}

//draw mega bounce charge arrow
if (state = state_megabounce_charge) {
	var yoffset = combo_offset;
	if obj_player.image_xscale = 1 {
		var xoffset = 0;
	}else {
		var xoffset = 1;
	}
	if wearing_hat = true {
		yoffset += 20;
	}
	draw_sprite_general(spr_megabounce_chargearrow_outline,0,0,0,sprite_get_width(spr_megabounce_chargearrow_outline),sprite_get_height(spr_megabounce_chargearrow_outline),x+(lengthdir_x(48+yoffset,angle+90))+(lengthdir_x(16+xoffset,angle+180)),y+(lengthdir_y(48+yoffset,angle+90))+(lengthdir_y(16+xoffset,angle+180)),1,-1,image_angle,c_white,c_white,c_white,c_white,1);
	draw_sprite_general(spr_megabounce_chargearrow_fill,0,0,0,sprite_get_width(spr_megabounce_chargearrow_fill),(sprite_get_height(spr_megabounce_chargearrow_fill)*(charge/charge_max)),x+(lengthdir_x(48+yoffset,angle+90))+(lengthdir_x(16+xoffset,angle+180)),y+(lengthdir_y(48+yoffset,angle+90))+(lengthdir_y(16+xoffset,angle+180)),1,-1,image_angle,c_white,c_white,c_white,c_white,1);
	draw_sprite_ext(red_sprite,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,(charge/charge_max)*0.6 + 0.1);
}


//revive
if (state = state_revive) {
	draw_sprite_ext(spr_player_revive,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,1);	
	draw_sprite_ext(revive_white_sprite,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,revive_alpha);	
}else if revive_alpha > 0 {
	draw_sprite_ext(spr_player_revive,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,revive_alpha);	
}

//draw slam trail
var slam_alpha = 0;
if ground_pound_slam = true or harpooning = true {
	if  harpooning = true {
		var y_dir = -1;
		var y_angle = direction+180;
		if state = state_grappling {
			if (slam_trail_distance  < slam_speed*2) {
				slam_trail_distance += 0.25 + ((slam_speed-slam_trail_distance)>9);
				}else { 
					slam_trail_distance += 0.1;
			}
		}else if slam_trail_distance > 0 {
			slam_trail_distance -= 0.25;
		}else {
			slam_trail_distance = 0;
			harpooning = false;	
			invincible = false;
		}
		var x_add = slam_trail_distance;
		var harpoon_sprite = spr_player_zekai_hat_falling3_empty;
	}else {
		var x_add = 0;
		var y_dir = 1;
		var y_angle = 90;
		if (slam_trail_distance  < slam_speed*2) {
			slam_trail_distance += 0.25 + ((slam_speed-slam_trail_distance)>9);
		}else { 
			slam_trail_distance += 0.1;
		}
		var harpoon_sprite = spr_player_zekai_hat_falling3;
	}
	
	for(i = 5; i > 0; i -= 1) {
		slam_alpha += 0.2;
		//draw jetpack during slam
		if pickups_array[0] = pickup_jetpack or pickups_array[1] = pickup_jetpack {
			draw_sprite_ext(spr_jetpack,0,x+lengthdir_x(x_add*i,y_angle),y+(lengthdir_y(slam_trail_distance*i,y_angle)),image_xscale,image_yscale,image_angle,c_white,slam_alpha);
		}
        draw_sprite_ext(sprite_index,image_index,x+lengthdir_x(x_add*i,y_angle),y+(lengthdir_y(slam_trail_distance*i,y_angle)),image_xscale,image_yscale,image_angle,c_white,slam_alpha);
		if invincibility = true {
			 //draw_sprite_ext(spr_player_zekai_invincible,image_index,x+lengthdir_x(x_add*i,y_angle),y+(lengthdir_y(slam_trail_distance*i,y_angle)),image_xscale,image_yscale,image_angle,c_white,slam_alpha);
		}
		//draw face during slam
		draw_sprite_ext(face_sprite,0,x+lengthdir_x(hurt_yoffset,angle-90)+lengthdir_x(x_add*i,y_angle),y+lengthdir_y(hurt_yoffset,angle-90)+(lengthdir_y(slam_trail_distance*i,y_angle)),image_xscale,image_yscale,image_angle,c_white,slam_alpha);
		//draw hat during slam
		if pickups_array[0] = pickup_hatgun or pickups_array[1] = pickup_hatgun {
			draw_sprite_ext(spr_player_zekai_hat_falling,image_index,x+lengthdir_x(x_add*i,y_angle),y+(lengthdir_y(slam_trail_distance*i,y_angle)),image_xscale,image_yscale,image_angle,c_white,slam_alpha);
		}
		//draw grappling helmet during slam
		if pickups_array[0] = pickup_grappling or pickups_array[1] = pickup_grappling {
			draw_sprite_ext(spr_player_zekai_hat_falling2,image_index,x+lengthdir_x(x_add*i,y_angle),y+(lengthdir_y(slam_trail_distance*i,y_angle)),image_xscale,image_yscale,image_angle,c_white,slam_alpha);
		}
		//draw harpoon helmet during slam
		if pickups_array[0] = pickup_harpoon or pickups_array[1] = pickup_harpoon {
			draw_sprite_ext(harpoon_sprite,image_index,x+lengthdir_x(x_add*i,y_angle),y+(lengthdir_y(slam_trail_distance*i,y_angle)),image_xscale,image_yscale,image_angle,c_white,slam_alpha);
		}
    }
	draw_self();
}

//invincibility
if invincibility = true and global.current_skin = 0 
or pogomode = true and global.current_skin = 0 {
	//scr_Draw_Skin(spr_player_zekai_invincible,spr_player_zekai_invincible_falling,spr_player_zekai_invincible_charging,spr_player_zekai_invincible_portal);
}


//draw hat gun
if pickups_array[0] = pickup_hatgun or pickups_array[1] = pickup_hatgun {
	if sprite_index = player_sprite or sprite_index = revive_sprite {
		draw_sprite_ext(spr_player_zekai_hat,image_index,x+lengthdir_x(hat_yoffset,angle+90), y+lengthdir_y(hat_yoffset,angle+90),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}else if sprite_index = falling_sprite {
		draw_sprite_ext(spr_player_zekai_hat_falling,image_index,x+lengthdir_x(hat_yoffset,angle+90),y+lengthdir_y(hat_yoffset,angle+90),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}else if sprite_index = charging_sprite {
		draw_sprite_ext(spr_player_zekai_hat_charging,image_index,x+lengthdir_x(hat_yoffset,angle+90),y+lengthdir_y(hat_yoffset,angle+90),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}else if sprite_index = portal_sprite and abs(image_xscale > 0.1) and image_yscale > 0.1 {
		draw_sprite_ext(spr_player_zekai_portal_hatgun,image_index,x+lengthdir_x(hat_yoffset,angle+90),y+lengthdir_y(hat_yoffset,angle+90),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}else if sprite_index = body_sprite {
		draw_sprite_ext(spr_player_hat_body,image_index,x+lengthdir_x(hat_yoffset,angle+90), y+lengthdir_y(hat_yoffset,angle+90),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}
}

//draw grappling helmet
if pickups_array[0] = pickup_grappling or pickups_array[1] = pickup_grappling {
	if sprite_index = player_sprite or sprite_index = revive_sprite {
		draw_sprite_ext(spr_player_zekai_hat2,image_index,x+lengthdir_x(hat_yoffset,angle+90),y+lengthdir_y(hat_yoffset,angle+90),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}else if sprite_index = falling_sprite {
		draw_sprite_ext(spr_player_zekai_hat_falling2,image_index,x+lengthdir_x(hat_yoffset,angle+90),y+lengthdir_y(hat_yoffset,angle+90),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}else if sprite_index = charging_sprite or sprite_index = red_sprite {
		draw_sprite_ext(spr_player_zekai_hat_charging2,image_index,x+lengthdir_x(hat_yoffset,angle+90),y+lengthdir_y(hat_yoffset,angle+90),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}else if sprite_index = portal_sprite and image_xscale > 0.1 and abs(image_yscale > 0.1) {
		draw_sprite_ext(spr_player_zekai_portal_grappling,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}else if sprite_index = body_sprite {
		draw_sprite_ext(spr_player_hat_body,image_index,x+lengthdir_x(hat_yoffset,angle+90),y+lengthdir_y(hat_yoffset,angle+90),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}
}

//draw harpoon helmet
if pickups_array[0] = pickup_harpoon or pickups_array[1] = pickup_harpoon {
	harpoon_empty = false;
	with obj_projectile {
		if gun_name = "Harpoon Helmet" {
			other.harpoon_empty = true;
		}
	}
	if harpoon_empty = false {
		if sprite_index = player_sprite or sprite_index = revive_sprite {
			draw_sprite_ext(spr_player_zekai_hat3,image_index,x+lengthdir_x(hat_yoffset,angle+90),y+lengthdir_y(hat_yoffset,angle+90),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
		}else if sprite_index = falling_sprite {
			draw_sprite_ext(spr_player_zekai_hat_falling3,image_index,x+lengthdir_x(hat_yoffset,angle+90),y+lengthdir_y(hat_yoffset,angle+90),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
		}else if sprite_index = charging_sprite or sprite_index = red_sprite {
			draw_sprite_ext(spr_player_zekai_hat_charging3,image_index,x+lengthdir_x(hat_yoffset,angle+90),y+lengthdir_y(hat_yoffset,angle+90),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
		}else if sprite_index = portal_sprite and image_xscale > 0.1 and abs(image_yscale > 0.1) {
			draw_sprite_ext(spr_player_zekai_portal_harpoon,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
		}else if sprite_index = body_sprite {
			draw_sprite_ext(spr_player_hat3_body,image_index,x+lengthdir_x(hat_yoffset,angle+90),y+lengthdir_y(hat_yoffset,angle+90),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
		}
	}else {
		if sprite_index = player_sprite or sprite_index = revive_sprite {
			draw_sprite_ext(spr_player_zekai_hat3_empty,image_index,x+lengthdir_x(hat_yoffset,angle+90),y+lengthdir_y(hat_yoffset,angle+90),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
		}else if sprite_index = falling_sprite {
			draw_sprite_ext(spr_player_zekai_hat_falling3_empty,image_index,x+lengthdir_x(hat_yoffset,angle+90),y+lengthdir_y(hat_yoffset,angle+90),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
		}else if sprite_index = charging_sprite or sprite_index = red_sprite {
			draw_sprite_ext(spr_player_zekai_hat_charging3_empty,image_index,x+lengthdir_x(hat_yoffset,angle+90),y+lengthdir_y(hat_yoffset,angle+90),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
		}else if sprite_index = portal_sprite and image_xscale > 0.1 and abs(image_yscale > 0.1) {
			draw_sprite_ext(spr_player_zekai_portal_harpoon_empty,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
		}else if sprite_index = body_sprite {
			draw_sprite_ext(spr_player_hat3_body_empty,image_index,x+lengthdir_x(hat_yoffset,angle+90),y+lengthdir_y(hat_yoffset,angle+90),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
		}
	}
}

//laser sight
scr_Laser_Sight();

//hurt skin
if current_iframes > 0 and bubble = false || dead {
	if angle < 0 {
		var temp_angle = 360 - abs(angle);	
	}else {
		var temp_angle = angle;	
	}
	if !(state = state_bulletblast and sprite_index != player_sprite) and state != state_portal and state != state_shop_portal and state != state_spawn and state != state_pogosmith {
		draw_sprite_ext(hurt_sprite,0,x+lengthdir_x(hurt_yoffset,angle-90),y+lengthdir_y(hurt_yoffset,angle-90),image_xscale,image_yscale,angle,image_blend,image_alpha);
	}
}else if !(sprite_index = charging_sprite) and state != state_chargejump and !(state = state_bulletblast and sprite_index != player_sprite) and state != state_spawn {
	if state != state_chargejump {
		if state != state_portal and state != state_shop_portal and (state != state_pogosmith) {
			draw_sprite_ext(face_sprite,0,x+lengthdir_x(hurt_yoffset,angle-90),y+lengthdir_y(hurt_yoffset,angle-90),image_xscale,image_yscale,angle,image_blend,image_alpha);
		}else if state != state_pogosmith {
			draw_sprite_ext(face_sprite,0,x+lengthdir_x(hurt_yoffset,angle-90),y+lengthdir_y(hurt_yoffset,angle-90),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
		}
	}
}

shader_reset();
}else {
	draw_sprite_ext(white_sprite,0,x+lengthdir_x(22,angle+90),y+lengthdir_y(22,angle+90),image_yscale*sign(image_xscale),image_yscale,angle,c_white,1);	
}

draw_set_color(c_white);

//six shooter UI
if sixshooter_held_num >= 10 and sixshooter_gun.inaccuracy != 25 and sixshooter_held_num < 45 and sixshooter_gun.current_bullets > 0 {
	//draw_sprite_general(spr_chargebar_sixshooter,0,0,0,sprite_get_width(spr_chargebar_sixshooter),sprite_get_height(spr_chargebar_sixshooter),x+lengthdir_x(12,image_angle+180)+lengthdir_x(4,image_angle-90),y+lengthdir_y(12,image_angle+180)+lengthdir_y(4,image_angle-90),1,1,image_angle,c_white,c_white,c_white,c_white,1);
	//draw_sprite_general(spr_chargebar_sixshooter_color,0,0,0,sprite_get_width(spr_chargebar_sixshooter_color)*((other.sixshooter_held_num-10)/(45-10)),sprite_get_height(spr_chargebar_sixshooter_color),x+lengthdir_x(12,image_angle+180)+lengthdir_x(4,image_angle-90),y+lengthdir_y(12,image_angle+180)+lengthdir_y(4,image_angle-90),1,1,image_angle,c_white,c_white,c_white,c_white,1);
}

//lock icon
if state = state_shop or table = true or (state = state_immobile and room = room_tutorial) {
	var distance = 62;
	distance += combo_offset;
			
	if instance_exists(obj_shieldbubble) {
		distance += 12; //8
	}else if pickups_array[0] = pickup_hatgun or pickups_array[1] = pickup_hatgun 
	or pickups_array[0] = pickup_grappling or pickups_array[1] = pickup_grappling 
	or pickups_array[0] = pickup_harpoon or pickups_array[1] =  pickup_harpoon { 
		distance += 18;
	}
	
	//sprite
	if image_xscale = 1 {
		draw_sprite_ext(spr_lockicon,1,x + lengthdir_x(distance,angle+90) + lengthdir_x(1,angle+180),y + lengthdir_y(distance,angle+90)+ lengthdir_y(1,angle+180),1,1,angle,c_white,1);	
	}else {
		draw_sprite_ext(spr_lockicon,1,x + lengthdir_x(distance,angle+90),y + lengthdir_y(distance,angle+90),1,1,angle,c_white,1);	
	}
}

if lock_unlocked = true {
	var distance = 62;
	distance += combo_offset;
			
	if instance_exists(obj_shieldbubble) {
		distance += 12; //8
	}else if pickups_array[0] = pickup_hatgun or pickups_array[1] = pickup_hatgun 
	or pickups_array[0] = pickup_grappling or pickups_array[1] = pickup_grappling 
	or pickups_array[0] = pickup_harpoon or pickups_array[1] =  pickup_harpoon { 
		distance += 18;
	}
	
	if lock_unlocked_frames < sprite_get_number(spr_lockicon_unlocked)-1 {
		lock_unlocked_frames += 0.5;
	}else if lock_alpha > 0 {
		if lock_alpha >= 1 {
			audio_play_sound(snd_zap,0,false);
		}
		lock_alpha -= 0.1;
	}else {
		lock_unlocked = false;
	}
	
	//sprite
	if image_xscale = 1 {
		draw_sprite_ext(spr_lockicon_unlocked,lock_unlocked_frames,x + lengthdir_x(distance,angle+90) + lengthdir_x(1,angle+180),y + lengthdir_y(distance,angle+90)+ lengthdir_y(1,angle+180),1,1,angle,c_white,lock_alpha);	
	}else {
		draw_sprite_ext(spr_lockicon_unlocked,lock_unlocked_frames,x + lengthdir_x(distance,angle+90),y + lengthdir_y(distance,angle+90),1,1,angle,c_white,lock_alpha);	
	}
}else {
	lock_unlocked_frames = 0;
}