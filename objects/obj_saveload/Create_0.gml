if (instance_number(obj_saveload) > 1) {
	instance_destroy();	
}else {
	scr_Save_Load_Variables();
}

scr_Settings_Initialize();

global.keyboard_sprites_array = [vk_up,vk_down,vk_left,vk_right,vk_space,vk_backspace,-1];
global.mouse_button_array = [mb_left, mb_middle, mb_right, mb_side1, mb_side2];

//key bindings

scr_Items_Unlocked();

scr_Controls();