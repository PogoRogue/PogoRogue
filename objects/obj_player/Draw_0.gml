/// @description draw self
if state != state_blink {
	
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

draw_self();

//draw hat gun
if pickups_array[0] = pickup_hatgun or pickups_array[1] = pickup_hatgun {
	if sprite_index = player_sprite or sprite_index = spr_player_revive_animation {
		draw_sprite_ext(spr_player_zekai_hat,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}else if sprite_index = falling_sprite {
		draw_sprite_ext(spr_player_zekai_hat_falling,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}else if sprite_index = charging_sprite {
		draw_sprite_ext(spr_player_zekai_hat_charging,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}
}

//revive
if (state = state_revive) {
	draw_sprite_ext(spr_player_revive,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,1);	
	draw_sprite_ext(spr_player_revive_white,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,revive_alpha);	
}else if revive_alpha > 0 {
	draw_sprite_ext(spr_player_revive,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,revive_alpha);	
}

//draw charge bar
if (state = state_chargejump) {
	draw_sprite_general(spr_chargebar,0,0,0,sprite_get_width(spr_chargebar),sprite_get_height(spr_chargebar),x+(lengthdir_x(16,image_angle)*image_xscale),y+(lengthdir_y(16,image_angle)*image_xscale),image_xscale,-1,image_angle,c_white,c_white,c_white,c_white,1);
	draw_sprite_general(spr_chargebar_color,0,0,0,sprite_get_width(spr_chargebar_color),sprite_get_height(spr_chargebar_color)*(charge/charge_max),x+(lengthdir_x(16,image_angle)*image_xscale),y+(lengthdir_y(16,image_angle)*image_xscale),image_xscale,-1,image_angle,c_white,c_white,c_white,c_white,1);
	draw_sprite_ext(spr_player_zekai_charging_red,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,(charge/charge_max)*0.6 + 0.1);
}

//draw slam trail
var slam_alpha = 0;
if ground_pound_slam = true {
	if (slam_trail_distance  < slam_speed*2) {
		slam_trail_distance += 0.25 + ((slam_speed-slam_trail_distance)>9);
	}else { 
		slam_trail_distance += 0.1;
	}
	for(i = 5; i > 0; i -= 1) {
		slam_alpha += 0.2;
        draw_sprite_ext(sprite_index,image_index,x,y-(i*slam_trail_distance),image_xscale,image_yscale,image_angle,c_white,slam_alpha);
		//draw hat during slam
		if pickups_array[0] = pickup_hatgun or pickups_array[1] = pickup_hatgun {
			draw_sprite_ext(spr_player_zekai_hat_falling,image_index,x,y-(i*slam_trail_distance),image_xscale,image_yscale,image_angle,c_white,slam_alpha);
		}
		//draw jetpack during slam
		if pickups_array[0] = pickup_jetpack or pickups_array[1] = pickup_jetpack {
			draw_sprite_ext(spr_jetpack,0,x,y-(i*slam_trail_distance),image_xscale,image_yscale,image_angle,c_white,slam_alpha);
		}
    }
	draw_self();
}
//laser sight
scr_Laser_Sight();

shader_reset();
}else {
	draw_sprite_ext(spr_player_zekai_falling_white,0,x+lengthdir_x(22,angle+90),y+lengthdir_y(22,angle+90),image_yscale*sign(image_xscale),image_yscale,angle,c_white,1);	
}

draw_set_color(c_white);