// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Controls_Array_Keyboard(){

	//ARRAY VALUES
	//player controls
	array_key_right_player = [scr_Keyboard_Get_Action(global.player_right_keys[0],"check"),scr_Keyboard_Get_Action(global.player_right_keys[1],"check")];
	array_key_left_player = [scr_Keyboard_Get_Action(global.player_left_keys[0],"check"),scr_Keyboard_Get_Action(global.player_left_keys[1],"check")];
	array_key_right_pressed_player = [scr_Keyboard_Get_Action(global.player_right_keys[0],"pressed"),scr_Keyboard_Get_Action(global.player_right_keys[1],"pressed")];
	array_key_left_pressed_player = [scr_Keyboard_Get_Action(global.player_left_keys[0],"pressed"),scr_Keyboard_Get_Action(global.player_left_keys[1],"pressed")];
	array_key_fire_projectile = [scr_Keyboard_Get_Action(global.shoot_keys[0],"check"),scr_Keyboard_Get_Action(global.shoot_keys[1],"check")];
	array_key_recenter = [scr_Keyboard_Get_Action(global.recenter_keys[0],"check"),scr_Keyboard_Get_Action(global.recenter_keys[1],"check")];
	array_key_fire_projectile_pressed = [scr_Keyboard_Get_Action(global.shoot_keys[0],"pressed"),scr_Keyboard_Get_Action(global.shoot_keys[1],"pressed")];
	array_key_fire_projectile_released = [scr_Keyboard_Get_Action(global.shoot_keys[0],"released"),scr_Keyboard_Get_Action(global.shoot_keys[1],"released")];
	array_key_pickup_1 = [scr_Keyboard_Get_Action(global.pickup1_keys[0],"check"),scr_Keyboard_Get_Action(global.pickup1_keys[1],"check")];
	array_key_pickup_2 = [scr_Keyboard_Get_Action(global.pickup2_keys[0],"check"),scr_Keyboard_Get_Action(global.pickup2_keys[1],"check")];
	array_key_pickup_1_pressed = [scr_Keyboard_Get_Action(global.pickup1_keys[0],"pressed"),scr_Keyboard_Get_Action(global.pickup1_keys[1],"pressed")];
	array_key_pickup_2_pressed = [scr_Keyboard_Get_Action(global.pickup2_keys[0],"pressed"),scr_Keyboard_Get_Action(global.pickup2_keys[1],"pressed")];
	array_key_interact = [scr_Keyboard_Get_Action(global.interact_keys[0],"pressed"),scr_Keyboard_Get_Action(global.interact_keys[1],"pressed")];
	array_key_weapon_1 = [scr_Keyboard_Get_Action(global.weapon1_keys[0],"pressed"),scr_Keyboard_Get_Action(global.weapon1_keys[1],"pressed")];
	array_key_weapon_2 = [scr_Keyboard_Get_Action(global.weapon2_keys[0],"pressed"),scr_Keyboard_Get_Action(global.weapon2_keys[1],"pressed")];
	array_key_weapon_3 = [scr_Keyboard_Get_Action(global.weapon3_keys[0],"pressed"),scr_Keyboard_Get_Action(global.weapon3_keys[1],"pressed")];
	array_key_weapon_up = [scr_Keyboard_Get_Action(global.nextweapon_keys[0],"pressed"),scr_Keyboard_Get_Action(global.nextweapon_keys[1],"pressed")]; 
	array_key_weapon_down = [scr_Keyboard_Get_Action(global.prevweapon_keys[0],"pressed"),scr_Keyboard_Get_Action(global.prevweapon_keys[1],"pressed")];
	array_key_aim = [scr_Keyboard_Get_Action(global.aim_keys[0],"check"),scr_Keyboard_Get_Action(global.aim_keys[1],"check")];

	//menus
	array_key_right_menu = [scr_Keyboard_Get_Action(global.menu_right_keys[0],"check"),scr_Keyboard_Get_Action(global.menu_right_keys[1],"check")];
	array_key_left_menu = [scr_Keyboard_Get_Action(global.menu_left_keys[0],"check"),scr_Keyboard_Get_Action(global.menu_left_keys[1],"check")];
	array_key_down_menu = [scr_Keyboard_Get_Action(global.menu_down_keys[0],"check"),scr_Keyboard_Get_Action(global.menu_down_keys[1],"check")];
	array_key_up_menu = [scr_Keyboard_Get_Action(global.menu_up_keys[0],"check"),scr_Keyboard_Get_Action(global.menu_up_keys[1],"check")];
	array_key_right_pressed_menu = [scr_Keyboard_Get_Action(global.menu_right_keys[0],"pressed"),scr_Keyboard_Get_Action(global.menu_right_keys[1],"pressed")];
	array_key_left_pressed_menu = [scr_Keyboard_Get_Action(global.menu_left_keys[0],"pressed"),scr_Keyboard_Get_Action(global.menu_left_keys[1],"pressed")];
	array_key_down_pressed_menu = [scr_Keyboard_Get_Action(global.menu_down_keys[0],"pressed"),scr_Keyboard_Get_Action(global.menu_down_keys[1],"pressed")];
	array_key_up_pressed_menu = [scr_Keyboard_Get_Action(global.menu_up_keys[0],"pressed"),scr_Keyboard_Get_Action(global.menu_up_keys[1],"pressed")];
	array_key_select = [scr_Keyboard_Get_Action(global.select_keys[0],"pressed"),scr_Keyboard_Get_Action(global.select_keys[1],"pressed")];
	array_key_back = [scr_Keyboard_Get_Action(global.back_keys[0],"pressed"),scr_Keyboard_Get_Action(global.back_keys[1],"pressed")];
	array_key_pause = [scr_Keyboard_Get_Action(global.pause_keys[0],"pressed"),scr_Keyboard_Get_Action(global.pause_keys[1],"pressed")];
	array_key_item_menu = [scr_Keyboard_Get_Action(global.item_keys[0],"pressed"),scr_Keyboard_Get_Action(global.item_keys[1],"pressed")];
	
}