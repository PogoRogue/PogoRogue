/// @description collision
//check for collision with ground y axis
if instance_exists(parent_obj) {
	if parent_obj.not_colliding = true {
		//pop
		if place_meeting(x,y,obj_spike) {
			alarm[0] = 1;
		}
		
		//check for collision with one way ground
		if place_meeting(x,y+obj_player.vspeed,obj_ground_oneway) and obj_player.vspeed > 0 {
			/*
			var oneway_ground = instance_place(x,y+obj_player.vspeed,obj_ground_oneway);
			if !place_meeting(x,y-1,oneway_ground) {
				while !(place_meeting(x,y+sign(obj_player.vspeed),oneway_ground)) {
					y += sign(obj_player.vspeed);
					parent_obj.y += sign(obj_player.vspeed);
				}
				obj_player.vspeed = 0; //stop player movement while bouncing
				parent_obj.bouncing = true;
				parent_obj.bouncing_bottom = true;
				parent_obj.sprite_index = spr_shieldbubble_new;
			}*/
			
			///////
			var _list = ds_list_create();
			var _num = instance_place_list(x,y+obj_player.vspeed,obj_ground_oneway, _list, false);
			if _num > 0 {
			    for (var i = 0; i < _num; ++i;) {
					if instance_exists(_list[| i]) {
						if _list[| i].bbox_top > bbox_bottom-obj_player.vspeed and !place_meeting(x,y-1,_list[| i]) {
							while !(place_meeting(x,y+sign(obj_player.vspeed),_list[| i])) {
								y += sign(obj_player.vspeed);
								parent_obj.y += sign(obj_player.vspeed);
							}
							with _list[| i] {
								//if place_meeting(x,bbox_top-obj_player.vspeed,other) {
									obj_player.vspeed = 0; //stop player movement while bouncing
									other.parent_obj.bouncing = true;
									other.parent_obj.bouncing_bottom = true;
									other.parent_obj.sprite_index = spr_shieldbubble_new;
								//}
							}
							break;
						}
					}
			    }
			}
	
			ds_list_destroy(_list);
		}
	
		//check for collision with ground y axis
		if (place_meeting(x,y+obj_player.vspeed,obj_ground)) and !place_meeting(x,y,obj_ground) and obj_player.vspeed > 0 {
			while !(place_meeting(x,y+sign(obj_player.vspeed),obj_ground)) {
				y += sign(obj_player.vspeed);
				parent_obj.y += sign(obj_player.vspeed);
			}
			obj_player.vspeed = 0; //stop player movement while bouncing
			parent_obj.bouncing = true;
			parent_obj.bouncing_bottom = true;
			parent_obj.sprite_index = spr_shieldbubble_new;
		}

		if (place_meeting(x,y+obj_player.vspeed,obj_ground)) and !place_meeting(x,y,obj_ground) and obj_player.vspeed <= 0 {
			while !(place_meeting(x,y+sign(obj_player.vspeed),obj_ground)) {
				y += sign(obj_player.vspeed);
				parent_obj.y += sign(obj_player.vspeed);
			}
			parent_obj.prev_vspd = obj_player.vspeed;
			parent_obj.bouncing = true;
			parent_obj.bouncing_top = true;
			parent_obj.sprite_index = spr_shieldbubble_new_top;
			//obj_player.vspeed *= -1; //stop player movement while bouncing
		}
	
		//check for collision with on off platform	
		if (place_meeting(x,y+obj_player.vspeed,obj_temp_platform_on_off) and !place_meeting(x,y-1,obj_temp_platform_on_off)) and obj_player.vspeed > 0 and obj_player.platform_on {
			while !(place_meeting(x,y+sign(obj_player.vspeed),obj_temp_platform_on_off)) {
				y += sign(obj_player.vspeed);
				parent_obj.y += sign(obj_player.vspeed);
			}
			obj_player.vspeed = 0; //stop player movement while bouncing
			parent_obj.bouncing = true;
			parent_obj.bouncing_bottom = true;
			parent_obj.sprite_index = spr_shieldbubble_new;
		}
	
		//check for collision with off on platform	
		if (place_meeting(x,y+obj_player.vspeed,obj_temp_platform_off_on) and !place_meeting(x,y-1,obj_temp_platform_off_on)) and obj_player.vspeed > 0 and !obj_player.platform_on and !place_meeting(x,y-16,obj_ground) {
			while !(place_meeting(x,y+sign(obj_player.vspeed),obj_temp_platform_off_on)) {
				y += sign(obj_player.vspeed);
				parent_obj.y += sign(obj_player.vspeed);
			}
			obj_player.vspeed = 0; //stop player movement while bouncing
			parent_obj.bouncing = true;
			parent_obj.bouncing_bottom = true;
			parent_obj.sprite_index = spr_shieldbubble_new;
		}
	}
}