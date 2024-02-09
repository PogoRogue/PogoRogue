// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Settings_Bindings(){
	
	option_resetdefaults = {
		_text: "Reset All Bindings To Default",
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
		_text: "Tilt Right",
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
		_text: "Tilt Left",
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
		_text: "Shoot",
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
		_text: "Recenter Player",
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
		_text: "Active 1",
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
		_text: "Active 2",
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
		_text: "Interact",
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
		_text: "Weapon 1",
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
		_text: "Weapon 2",
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
		_text: "Weapon 3",
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
		_text: "Next Weapon",
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
		_text: "Previous Weapon",
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
		_text: "Pause",
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
		_text: "Open Item Menu",
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
		_text: "Menu Right",
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
		_text: "Menu Left",
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
		_text: "Menu Down",
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
		_text: "Menu Up",
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
		_text: "Select",
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
		_text: "Back",
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
		num_of_options: 21,									
		options_array: [option_resetdefaults,option_right_player,option_left_player,option_shoot,
						option_recenter,option_pickup1,option_pickup2,
						option_interact,option_weapon1,option_weapon2,
						option_weapon3,option_nextweapon,option_prevweapon,
						option_pause,option_item,option_right_menu,option_left_menu,
						option_down_menu,option_up_menu,option_select,option_back],
	};
}