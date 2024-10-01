depth -= 1000;

center_x = 768/2;
center_y = 432/2;
select = 1;
selected = false;
if obj_player.weapons_equipped = 1 or obj_player.weapons_equipped = 2 {
	num_of_slots = 3;
}else if obj_player.weapons_equipped = 3 {
	num_of_slots = 4;
}
select_sprite_keyboard = spr_arrow_up;
select_sprite_controller = spr_controller_button_bottom;
select_sprite = select_sprite_keyboard;
alpha = 1.25;
fade_away = false;
item1_name = "";
item2_name = "";
item3_name = "";
player_x = obj_player_mask.x;
player_y = obj_player_mask.y;
player_depth = obj_player_mask.depth;

with obj_pause {
	paused_outside = true;
}

moving_in = true;
centered = false;
spd = 16;
spd2 = 0;
spd_multiply = 1;
target_x = camera_get_view_width(view_camera[0])/2;

x = -(camera_get_view_width(view_camera[0])/4);
y = center_y-108;

experimenting_coins = 25;
replaced_item_cost = 0;
item1_cost = 0;
item2_cost = 0;
item3_cost = 0;
coin_string = ["","",""];
coin_string_set = true;
alarm[4] = 30;