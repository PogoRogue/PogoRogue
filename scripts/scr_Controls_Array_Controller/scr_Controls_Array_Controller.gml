// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Controls_Array_Controller(){
	
	//if scr_Gamepad_Check_Input() > 0 {
		//ARRAY VALUES
		//player controls
		array_key_right_player = [scr_Gamepad_Get_Action(global.player_right_buttons[0],"check"),scr_Gamepad_Get_Action(global.player_right_buttons[1],"check")];
		array_key_left_player = [scr_Gamepad_Get_Action(global.player_left_buttons[0],"check"),scr_Gamepad_Get_Action(global.player_left_buttons[1],"check")];
		array_key_right_pressed_player = [scr_Gamepad_Get_Action(global.player_right_buttons[0],"pressed"),scr_Gamepad_Get_Action(global.player_right_buttons[1],"pressed")];
		array_key_left_pressed_player = [scr_Gamepad_Get_Action(global.player_left_buttons[0],"pressed"),scr_Gamepad_Get_Action(global.player_left_buttons[1],"pressed")];
		array_key_fire_projectile = [scr_Gamepad_Get_Action(global.shoot_buttons[0],"check"),scr_Gamepad_Get_Action(global.shoot_buttons[1],"check")];
		array_key_recenter = [scr_Gamepad_Get_Action(global.recenter_buttons[0],"check"),scr_Gamepad_Get_Action(global.recenter_buttons[1],"check")];
		array_key_fire_projectile_pressed = [scr_Gamepad_Get_Action(global.shoot_buttons[0],"pressed"),scr_Gamepad_Get_Action(global.shoot_buttons[1],"pressed")];
		array_key_fire_projectile_released = [scr_Gamepad_Get_Action(global.shoot_buttons[0],"released"),scr_Gamepad_Get_Action(global.shoot_buttons[1],"released")];
		array_key_pickup_1 = [scr_Gamepad_Get_Action(global.pickup1_buttons[0],"check"),scr_Gamepad_Get_Action(global.pickup1_buttons[1],"check")];
		array_key_pickup_2 = [scr_Gamepad_Get_Action(global.pickup2_buttons[0],"check"),scr_Gamepad_Get_Action(global.pickup2_buttons[1],"check")];
		array_key_pickup_1_pressed = [scr_Gamepad_Get_Action(global.pickup1_buttons[0],"pressed"),scr_Gamepad_Get_Action(global.pickup1_buttons[1],"pressed")];
		array_key_pickup_2_pressed = [scr_Gamepad_Get_Action(global.pickup2_buttons[0],"pressed"),scr_Gamepad_Get_Action(global.pickup2_buttons[1],"pressed")];
		array_key_interact = [scr_Gamepad_Get_Action(global.interact_buttons[0],"pressed"),scr_Gamepad_Get_Action(global.interact_buttons[1],"pressed")];
		array_key_weapon_1 = [scr_Gamepad_Get_Action(global.weapon1_buttons[0],"pressed"),scr_Gamepad_Get_Action(global.weapon1_buttons[1],"pressed")];
		array_key_weapon_2 = [scr_Gamepad_Get_Action(global.weapon2_buttons[0],"pressed"),scr_Gamepad_Get_Action(global.weapon2_buttons[1],"pressed")];
		array_key_weapon_3 = [scr_Gamepad_Get_Action(global.weapon3_buttons[0],"pressed"),scr_Gamepad_Get_Action(global.weapon3_buttons[1],"pressed")];
		array_key_weapon_up = [scr_Gamepad_Get_Action(global.nextweapon_buttons[0],"pressed"),scr_Gamepad_Get_Action(global.nextweapon_buttons[1],"pressed")];
		array_key_weapon_down = [scr_Gamepad_Get_Action(global.prevweapon_buttons[0],"pressed"),scr_Gamepad_Get_Action(global.prevweapon_buttons[1],"pressed")];

		//menus
		array_key_right_menu = [scr_Gamepad_Get_Action(global.menu_right_buttons[0],"check"),scr_Gamepad_Get_Action(global.menu_right_buttons[1],"check")];
		array_key_left_menu = [scr_Gamepad_Get_Action(global.menu_left_buttons[0],"check"),scr_Gamepad_Get_Action(global.menu_left_buttons[1],"check")];
		array_key_down_menu = [scr_Gamepad_Get_Action(global.menu_down_buttons[0],"check"),scr_Gamepad_Get_Action(global.menu_down_buttons[1],"check")];
		array_key_up_menu = [scr_Gamepad_Get_Action(global.menu_up_buttons[0],"check"),scr_Gamepad_Get_Action(global.menu_up_buttons[1],"check")];
		array_key_right_pressed_menu = [scr_Gamepad_Get_Action(global.menu_right_buttons[0],"pressed"),scr_Gamepad_Get_Action(global.menu_right_buttons[1],"pressed")];
		array_key_left_pressed_menu = [scr_Gamepad_Get_Action(global.menu_left_buttons[0],"pressed"),scr_Gamepad_Get_Action(global.menu_left_buttons[1],"pressed")];
		array_key_down_pressed_menu = [scr_Gamepad_Get_Action(global.menu_down_buttons[0],"pressed"),scr_Gamepad_Get_Action(global.menu_down_buttons[1],"pressed")];
		array_key_up_pressed_menu = [scr_Gamepad_Get_Action(global.menu_up_buttons[0],"pressed"),scr_Gamepad_Get_Action(global.menu_up_buttons[1],"pressed")];
		array_key_select = [scr_Gamepad_Get_Action(global.select_buttons[0],"pressed"),scr_Gamepad_Get_Action(global.select_buttons[1],"pressed")];
		array_key_back = [scr_Gamepad_Get_Action(global.back_buttons[0],"pressed"),scr_Gamepad_Get_Action(global.back_buttons[1],"pressed")];
		array_key_pause = [scr_Gamepad_Get_Action(global.pause_buttons[0],"pressed"),scr_Gamepad_Get_Action(global.pause_buttons[1],"pressed")];
		array_key_item_menu = [scr_Gamepad_Get_Action(global.item_buttons[0],"pressed"),scr_Gamepad_Get_Action(global.item_buttons[1],"pressed")];
	//}else { //no controller button is being used
		/*
		//ARRAY VALUES
		//player controls
		array_key_right_player = [0,0];
		array_key_left_player = [0,0];
		array_key_right_pressed_player = [0,0];
		array_key_left_pressed_player = [0,0];
		array_key_fire_projectile = [0,0];
		array_key_recenter = [0,0];
		array_key_fire_projectile_pressed = [0,0];
		array_key_fire_projectile_released = [0,0];
		array_key_pickup_1 = [0,0];
		array_key_pickup_2 = [0,0];
		array_key_pickup_1_pressed = [0,0];
		array_key_pickup_2_pressed = [0,0];
		array_key_interact = [0,0];
		array_key_weapon_1 = [0,0];
		array_key_weapon_2 = [0,0];
		array_key_weapon_3 = [0,0];
		array_key_weapon_up = [0,0];
		array_key_weapon_down = [0,0];

		//menus
		array_key_right_menu = [0,0];
		array_key_left_menu = [0,0];
		array_key_down_menu = [0,0];
		array_key_up_menu = [0,0];
		array_key_right_pressed_menu = [0,0];
		array_key_left_pressed_menu = [0,0];
		array_key_down_pressed_menu = [0,0];
		array_key_up_pressed_menu = [0,0];
		array_key_select = [0,0];
		array_key_back = [0,0];
		array_key_pause = [0,0];
		array_key_item_menu = [0,0];
		*/
	//}
	
}