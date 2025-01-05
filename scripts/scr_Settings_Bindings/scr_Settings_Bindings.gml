// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Settings_Bindings(){
	
	option_resetdefaults = {
		_text: "恢复默认键位",
		_type: "doonpress",
		do_on_press: function() {
			with obj_settings {
				audio_play_sound(snd_selectOption,0,false);
				usable = false;
				instance_create_depth(x,y,depth-1,obj_popup_resetdefaults_bindings);
			}
		}
	};
	
	option_right_player = {
		_text: "向右转向",
		_type: "doonpress",
		do_on_press: function() {
			with obj_settings {
				audio_play_sound(snd_selectOption,0,false);
				usable = false;
				instance_create_depth(x,y,depth-1,obj_popup_rebind);
			}
		}
	};
	
	option_left_player = {
		_text: "向左转向",
		_type: "doonpress",
		do_on_press: function() {
			with obj_settings {
				audio_play_sound(snd_selectOption,0,false);
				usable = false;
				instance_create_depth(x,y,depth-1,obj_popup_rebind);
			}
		}
	};
	
	option_shoot = {
		_text: "射击",
		_type: "doonpress",
		do_on_press: function() {
			with obj_settings {
				audio_play_sound(snd_selectOption,0,false);
				usable = false;
				instance_create_depth(x,y,depth-1,obj_popup_rebind);
			}
		}
	};
	
	option_recenter = {
		_text: "方向回正",
		_type: "doonpress",
		do_on_press: function() {
			with obj_settings {
				audio_play_sound(snd_selectOption,0,false);
				usable = false;
				instance_create_depth(x,y,depth-1,obj_popup_rebind);
			}
		}
	};
	
	option_pickup1 = {
		_text: "技能1",
		_type: "doonpress",
		do_on_press: function() {
			with obj_settings {
				audio_play_sound(snd_selectOption,0,false);
				usable = false;
				instance_create_depth(x,y,depth-1,obj_popup_rebind);
			}
		}
	};
	
	option_pickup2 = {
		_text: "技能2",
		_type: "doonpress",
		do_on_press: function() {
			with obj_settings {
				audio_play_sound(snd_selectOption,0,false);
				usable = false;
				instance_create_depth(x,y,depth-1,obj_popup_rebind);
			}
		}
	};
	
	option_interact = {
		_text: "互动",
		_type: "doonpress",
		do_on_press: function() {
			with obj_settings {
				audio_play_sound(snd_selectOption,0,false);
				usable = false;
				instance_create_depth(x,y,depth-1,obj_popup_rebind);
			}
		}
	};
	
	option_weapon1 = {
		_text: "武器1",
		_type: "doonpress",
		do_on_press: function() {
			with obj_settings {
				audio_play_sound(snd_selectOption,0,false);
				usable = false;
				instance_create_depth(x,y,depth-1,obj_popup_rebind);
			}
		}
	};
	
	option_weapon2 = {
		_text: "武器2",
		_type: "doonpress",
		do_on_press: function() {
			with obj_settings {
				audio_play_sound(snd_selectOption,0,false);
				usable = false;
				instance_create_depth(x,y,depth-1,obj_popup_rebind);
			}
		}
	};
	
	option_weapon3 = {
		_text: "武器3",
		_type: "doonpress",
		do_on_press: function() {
			with obj_settings {
				audio_play_sound(snd_selectOption,0,false);
				usable = false;
				instance_create_depth(x,y,depth-1,obj_popup_rebind);
			}
		}
	};
	
	option_nextweapon = {
		_text: "切换到下一把武器",
		_type: "doonpress",
		do_on_press: function() {
			with obj_settings {
				audio_play_sound(snd_selectOption,0,false);
				usable = false;
				instance_create_depth(x,y,depth-1,obj_popup_rebind);
			}
		}
	};
	
	option_prevweapon = {
		_text: "切换到上一把武器",
		_type: "doonpress",
		do_on_press: function() {
			with obj_settings {
				audio_play_sound(snd_selectOption,0,false);
				usable = false;
				instance_create_depth(x,y,depth-1,obj_popup_rebind);
			}
		}
	};
	
	option_pause = {
		_text: "暂停",
		_type: "doonpress",
		do_on_press: function() {
			with obj_settings {
				audio_play_sound(snd_selectOption,0,false);
				usable = false;
				instance_create_depth(x,y,depth-1,obj_popup_rebind);
			}
		}
	};
	
	option_item = {
		_text: "打开物品面板",
		_type: "doonpress",
		do_on_press: function() {
			with obj_settings {
				audio_play_sound(snd_selectOption,0,false);
				usable = false;
				instance_create_depth(x,y,depth-1,obj_popup_rebind);
			}
		}
	};
	
	option_aim = {
		_text: "放慢转向",
		_type: "doonpress",
		do_on_press: function() {
			with obj_settings {
				audio_play_sound(snd_selectOption,0,false);
				usable = false;
				instance_create_depth(x,y,depth-1,obj_popup_rebind);
			}
		}
	};
	
	option_right_menu = {
		_text: "菜单向右",
		_type: "doonpress",
		do_on_press: function() {
			with obj_settings {
				audio_play_sound(snd_selectOption,0,false);
				usable = false;
				instance_create_depth(x,y,depth-1,obj_popup_rebind);
			}
		}
	};
	
	option_left_menu = {
		_text: "菜单向左",
		_type: "doonpress",
		do_on_press: function() {
			with obj_settings {
				audio_play_sound(snd_selectOption,0,false);
				usable = false;
				instance_create_depth(x,y,depth-1,obj_popup_rebind);
			}
		}
	};
	
	option_down_menu = {
		_text: "菜单向下",
		_type: "doonpress",
		do_on_press: function() {
			with obj_settings {
				audio_play_sound(snd_selectOption,0,false);
				usable = false;
				instance_create_depth(x,y,depth-1,obj_popup_rebind);
			}
		}
	};
	
	option_up_menu = {
		_text: "菜单向上",
		_type: "doonpress",
		do_on_press: function() {
			with obj_settings {
				audio_play_sound(snd_selectOption,0,false);
				usable = false;
				instance_create_depth(x,y,depth-1,obj_popup_rebind);
			}
		}
	};
	
	option_select = {
		_text: "选择",
		_type: "doonpress",
		do_on_press: function() {
			with obj_settings {
				audio_play_sound(snd_selectOption,0,false);
				usable = false;
				instance_create_depth(x,y,depth-1,obj_popup_rebind);
			}
		}
	};
	
	option_back = {
		_text: "返回",
		_type: "doonpress",
		do_on_press: function() {
			with obj_settings {
				audio_play_sound(snd_selectOption,0,false);
				usable = false;
				instance_create_depth(x,y,depth-1,obj_popup_rebind);
			}
		}
	};

	menu_bindings = {
		num_of_options: 22,									
		options_array: [option_resetdefaults,option_right_player,option_left_player,option_shoot,
						option_recenter,option_pickup1,option_pickup2,
						option_interact,option_weapon1,option_weapon2,
						option_weapon3,option_nextweapon,option_prevweapon,
						option_pause,option_item,option_aim,option_right_menu,option_left_menu,
						option_down_menu,option_up_menu,option_select,option_back],
	};
}