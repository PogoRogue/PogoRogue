// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Controls(){
	//-10000 = left joystick left
	//-10001 = left joystick right
	//-10002 = left joystick up
	//-10003 = left joystick down
	//-10004 = right joystick left
	//-10005 = right joystick right
	//-10006 = right joystick up
	//-10007 = right joystick down
	
	//KEYBOARD
	//gameplay
	global.player_right_keys = [vk_right,-1];
	global.player_left_keys = [vk_left,-1];
	global.shoot_keys = [vk_space,-1];
	global.recenter_keys = [vk_up,ord("W")];
	global.pickup1_keys = [ord("A"),vk_shift];
	global.pickup2_keys = [ord("D"),vk_lcontrol];
	global.interact_keys = [ord("E"),-1];
	global.weapon1_keys = [ord("1"),-1];
	global.weapon2_keys = [ord("2"),-1];
	global.weapon3_keys = [ord("3"),-1];
	global.nextweapon_keys = [ord("Q"),-1];
	global.prevweapon_keys = [-1,-1];
	global.pause_keys = [vk_escape,ord("P")];
	global.item_keys = [vk_tab,-1];
	
	//menu
	global.menu_right_keys = [vk_right,ord("D")];
	global.menu_left_keys = [vk_left,ord("A")];
	global.menu_down_keys = [vk_down,ord("S")];
	global.menu_up_keys = [vk_up,ord("W")];
	global.select_keys = [vk_enter,vk_space];
	global.back_keys = [vk_escape,-1];

	global.keyboard_array = [global.player_right_keys,global.player_left_keys,global.shoot_keys,global.recenter_keys,global.pickup1_keys,
	global.pickup2_keys,global.interact_keys,global.weapon1_keys,global.weapon2_keys,global.weapon3_keys,global.nextweapon_keys,global.prevweapon_keys,
	global.pause_keys,global.item_keys,global.menu_right_keys,global.menu_left_keys,global.menu_down_keys,global.menu_up_keys,global.select_keys,global.back_keys];
	
	//GAMEPAD
	//gameplay
	global.player_right_buttons = [-10001,gp_padr];
	global.player_left_buttons = [-10000,gp_padl];
	global.shoot_buttons = [gp_shoulderrb,-1];
	global.recenter_buttons = [-10002,gp_padu];
	global.pickup1_buttons = [gp_face1,-1];
	global.pickup2_buttons = [gp_face2,-1];
	global.interact_buttons = [gp_face4,-1];
	global.weapon1_buttons = [-1,-1];
	global.weapon2_buttons = [-1,-1];
	global.weapon3_buttons = [-1,-1];
	global.nextweapon_buttons = [gp_shoulderr,-1];
	global.prevweapon_buttons = [gp_shoulderl,-1];
	global.pause_buttons = [gp_start,-1];
	global.item_buttons = [gp_select,-1];
	
	//menu
	global.menu_right_buttons = [-10001,gp_padr];
	global.menu_left_buttons = [-10000,gp_padl];
	global.menu_down_buttons = [-10003,gp_padd];
	global.menu_up_buttons = [-10002,gp_padu];
	global.select_buttons = [gp_face1,-1];
	global.back_buttons = [gp_face2,-1];

	global.gamepad_array = [global.player_right_buttons,global.player_left_buttons,global.shoot_buttons,global.recenter_buttons,global.pickup1_buttons,
	global.pickup2_buttons,global.interact_buttons,global.weapon1_buttons,global.weapon2_buttons,global.weapon3_buttons,global.nextweapon_buttons,global.prevweapon_buttons,
	global.pause_buttons,global.item_buttons,global.menu_right_buttons,global.menu_left_buttons,global.menu_down_buttons,global.menu_up_buttons,global.select_buttons,global.back_buttons];

	//save values
	for(i = 0; i < array_length(global.keyboard_array); i++) {
		for (j = 0; j < 2; j++) {
			ini_open("controls.ini");
			global.keyboard_array[i][j] = ini_read_real("controls", "key " + string(i) + "_" + string(j), global.keyboard_array[i][j]);
			ini_close();
			scr_Save_Controls("key " + string(i) + "_" + string(j),global.keyboard_array[i][j]);
		}
	}
	for(i = 0; i < array_length(global.gamepad_array); i++) {
		for (j = 0; j < 2; j++) {
			ini_open("controls.ini");
			global.gamepad_array[i][j] = ini_read_real("controls", "gp " + string(i) + "_" + string(j), global.gamepad_array[i][j]);
			ini_close();
			scr_Save_Controls("gp " + string(i) + "_" + string(j),global.gamepad_array[i][j]);
		}
	}
	
	global.player_right_keys = global.keyboard_array[0];
	global.player_left_keys = global.keyboard_array[1];
	global.shoot_keys = global.keyboard_array[2];
	global.recenter_keys = global.keyboard_array[3];
	global.pickup1_keys = global.keyboard_array[4];
	global.pickup2_keys = global.keyboard_array[5];
	global.interact_keys = global.keyboard_array[6];
	global.weapon1_keys = global.keyboard_array[7];
	global.weapon2_keys = global.keyboard_array[8];
	global.weapon3_keys = global.keyboard_array[9];
	global.nextweapon_keys = global.keyboard_array[10];
	global.prevweapon_keys = global.keyboard_array[11];
	global.pause_keys = global.keyboard_array[12];
	global.item_keys = global.keyboard_array[13];
	
	//menu
	global.menu_right_keys = global.keyboard_array[14];
	global.menu_left_keys = global.keyboard_array[15];
	global.menu_down_keys = global.keyboard_array[16];
	global.menu_up_keys = global.keyboard_array[17];
	global.select_keys = global.keyboard_array[18];
	global.back_keys = global.keyboard_array[19];
	
	global.keyboard_gameplay_array = [global.player_right_keys,global.player_left_keys,global.shoot_keys,global.recenter_keys,global.pickup1_keys,
	global.pickup2_keys,global.interact_keys,global.weapon1_keys,global.weapon2_keys,global.weapon3_keys,global.nextweapon_keys,global.prevweapon_keys,
	global.pause_keys,global.item_keys];
	
	global.keyboard_menu_array = [global.menu_right_keys,global.menu_left_keys,global.menu_down_keys,global.menu_up_keys,global.select_keys,global.back_keys];
	
	//GAMEPAD
	//gameplay
	global.player_right_buttons = global.gamepad_array[0];
	global.player_left_buttons = global.gamepad_array[1];
	global.shoot_buttons = global.gamepad_array[2];
	global.recenter_buttons = global.gamepad_array[3];
	global.pickup1_buttons = global.gamepad_array[4];
	global.pickup2_buttons = global.gamepad_array[5];
	global.interact_buttons = global.gamepad_array[6];
	global.weapon1_buttons = global.gamepad_array[7];
	global.weapon2_buttons = global.gamepad_array[8];
	global.weapon3_buttons = global.gamepad_array[9];
	global.nextweapon_buttons = global.gamepad_array[10];
	global.prevweapon_buttons = global.gamepad_array[11];
	global.pause_buttons = global.gamepad_array[12];
	global.item_buttons = global.gamepad_array[13];
	
	//menu
	global.menu_right_buttons = global.gamepad_array[14];
	global.menu_left_buttons = global.gamepad_array[15];
	global.menu_down_buttons = global.gamepad_array[16];
	global.menu_up_buttons = global.gamepad_array[17];
	global.select_buttons = global.gamepad_array[18];
	global.back_buttons = global.gamepad_array[19];
	
	global.gamepad_gameplay_array = [global.player_right_buttons,global.player_left_buttons,global.shoot_buttons,global.recenter_buttons,global.pickup1_buttons,
	global.pickup2_buttons,global.interact_buttons,global.weapon1_buttons,global.weapon2_buttons,global.weapon3_buttons,global.nextweapon_buttons,global.prevweapon_buttons,
	global.pause_buttons,global.item_buttons];
	
	global.gamepad_menu_array = [global.menu_right_buttons,global.menu_left_buttons,global.menu_down_buttons,global.menu_up_buttons,global.select_buttons,global.back_buttons];

	global.current_skin = 0;
}