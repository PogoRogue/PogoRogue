if (instance_number(obj_saveload) > 1) {
	instance_destroy();	
}else {
	scr_Save_Load_Variables();
}

scr_Settings_Initialize();

global.keyboard_sprites_array = [vk_up,vk_down,vk_left,vk_right,vk_space];

//key bindings
	
//KEYBOARD
//gameplay
global.player_right_keys = [ord("D"),vk_right];
global.player_left_keys = [ord("A"),vk_left];
global.shoot_keys = [vk_space,-1];
global.recenter_keys = [ord("W"),vk_up];
global.pickup1_keys = [mb_left,-1];
global.pickup2_keys = [mb_right,-1];
global.interact_keys = [ord("E"),-1];
global.weapon1_keys = [ord("1"),-1];
global.weapon2_keys = [ord("2"),-1];
global.weapon3_keys = [ord("3"),-1];
global.nextweapon_keys = [-1,-1];
global.prevweapon_keys = [-1,-1];
	
global.keyboard_gameplay_array = [global.player_right_keys,global.player_left_keys,global.shoot_keys,global.recenter_keys,global.pickup1_keys,
global.pickup2_keys,global.interact_keys,global.weapon1_keys,global.weapon2_keys,global.weapon3_keys,global.nextweapon_keys,global.prevweapon_keys];
	
//menu
global.menu_right_keys = [ord("D"),vk_right];
global.menu_left_keys = [ord("A"),vk_left];
global.menu_down_keys = [ord("S"),vk_down];
global.menu_up_keys = [ord("W"),vk_up];
global.select_keys = [vk_enter,vk_space];
global.back_keys = [vk_escape,-1];
global.pause_keys = [vk_escape,ord("P")];
global.item_keys = [vk_tab,-1];
	
global.keyboard_menu_array = [global.menu_right_keys,global.menu_left_keys,global.menu_down_keys,global.menu_up_keys,global.select_keys,global.back_keys,global.pause_keys,global.item_keys];

global.keyboard_array = [global.player_right_keys,global.player_left_keys,global.shoot_keys,global.recenter_keys,global.pickup1_keys,
global.pickup2_keys,global.interact_keys,global.weapon1_keys,global.weapon2_keys,global.weapon3_keys,global.nextweapon_keys,global.prevweapon_keys,
global.menu_right_keys,global.menu_left_keys,global.menu_down_keys,global.menu_up_keys,global.select_keys,global.back_keys,global.pause_keys,global.item_keys];
	
//GAMEPAD
//gameplay
global.player_right_buttons = ["gp_axislhr",-1];
global.player_left_buttons = ["gp_axislhl",-1];
global.shoot_buttons = [gp_shoulderrb,-1];
global.recenter_buttons = ["gp_axislvu",-1];
global.pickup1_buttons = [gp_face1,-1];
global.pickup2_buttons = [gp_face2,-1];
global.interact_buttons = [gp_face4,-1];
global.weapon1_buttons = [-1,-1];
global.weapon2_buttons = [-1,-1];
global.weapon3_buttons = [-1,-1];
global.nextweapon_buttons = [gp_shoulderr,-1];
global.prevweapon_buttons = [gp_shoulderl,-1];
	
global.gamepad_gameplay_array = [global.player_right_buttons,global.player_left_buttons,global.shoot_buttons,global.recenter_buttons,global.pickup1_buttons,
global.pickup2_buttons,global.interact_buttons,global.weapon1_buttons,global.weapon2_buttons,global.weapon3_buttons,global.nextweapon_buttons,global.prevweapon_buttons];
	
//menu
global.menu_right_buttons = ["gp_axislhr",gp_shoulderr];
global.menu_left_buttons = ["gp_axislhl",gp_shoulderl];
global.menu_down_buttons = ["gp_axislvd",-1];
global.menu_up_buttons = ["gp_axislvu",-1];
global.select_buttons = [gp_face1,-1];
global.back_buttons = [gp_face2,-1];
global.pause_buttons = [gp_start,-1];
global.item_buttons = [gp_select,-1];
	
global.gamepad_menu_array = [global.menu_right_buttons,global.menu_left_buttons,global.menu_down_buttons,global.menu_up_buttons,global.select_buttons,global.back_buttons,global.pause_buttons,global.item_buttons];

global.gamepad_array = [global.player_right_buttons,global.player_left_buttons,global.shoot_buttons,global.recenter_buttons,global.pickup1_buttons,
global.pickup2_buttons,global.interact_buttons,global.weapon1_buttons,global.weapon2_buttons,global.weapon3_buttons,global.nextweapon_buttons,global.prevweapon_buttons,
global.menu_right_buttons,global.menu_left_buttons,global.menu_down_buttons,global.menu_up_buttons,global.select_buttons,global.back_buttons,global.pause_buttons,global.item_buttons];