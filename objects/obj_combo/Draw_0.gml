if obj_player.state != obj_player.state_blink and obj_player.state != obj_player.state_portal  and obj_player.state != obj_player.state_shop_portal {

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(fnt_combo2);

var white = make_color_rgb(255,255,255);
var combometer_sprite = spr_combometer;

if low_combo_meter = true {
	combometer_sprite = spr_combometer_red;
}

if global.combo > 0 {
	with obj_player {
		if room != room_boss_1 and room != room_boss_2 and room != room_boss_3 {
			var distance = 48;
			if pickups_array[0] = pickup_hatgun or pickups_array[1] = pickup_hatgun
			or pickups_array[0] = pickup_grappling or pickups_array[1] = pickup_grappling { 
				distance += 18;
			}
			if instance_exists(obj_shieldbubble) {
				distance += 8;
			}
			if other.combometer_scale <= 1 {
				draw_set_color(other.text_color);
			}
			draw_sprite_ext(combometer_sprite,0,x + lengthdir_x(distance+2,angle+90),y + lengthdir_y(distance+2,angle+90),1+(global.combo_time_added/600),1,angle,white,1);
			var _x = -sprite_get_xoffset(combometer_sprite)*(1+(global.combo_time_added/600));
			var _y = -sprite_get_yoffset(combometer_sprite);
			var _c = dcos(angle);
			var _s = dsin(angle);
			draw_sprite_general(combometer_sprite,1,0,0,global.combo_length,4,x  + lengthdir_x(distance+2,angle+90)+_c*_x+_s*_y,y + lengthdir_y(distance+2,angle+90)-_s*_x+_c*_y,1+(global.combo_time_added/600),1,angle,c_white,c_white,c_white,c_white,1);
		
			if (other.combometer_scale > 1) { //increase combo effect
				draw_sprite_ext(combometer_sprite,1,x  + lengthdir_x(distance+2,angle+90),y + lengthdir_y(distance+2,angle+90),other.combometer_scale+(global.combo_time_added/600),other.combometer_scale+0.4,angle,other.meter_color,1);
			}
			
			draw_set_color(other.text_color);
			//text
			if other.low_combo_meter = true {
				draw_set_color(make_color_rgb(180,82,82));
			}else {
				draw_set_color(other.text_color);
			}
			
			draw_text_transformed(x + lengthdir_x(distance+5,angle+90),y + lengthdir_y(distance+5,angle+90),"x" + string(global.combo) + " Combo",other.combometer_scale,other.combometer_scale,angle);
		}
	}
}

draw_set_color(c_white);
}