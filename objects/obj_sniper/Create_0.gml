image_speed = 1;
laser_x = obj_player.x - x;
laser_y = obj_player.y - y;
init_damage = damage;
init_sprite = sprite_index;
gun_name = "Sniper Rifle";
destroy_on_impact = false;
sniped = false;
laser_boost = false;
angle = obj_player.image_angle-90;
cut_sound = true;
image_index = sprite_get_number(sprite_index)-2;
if obj_player.sniper_gun.spread_number = 1 {
	image_angle = obj_player.image_angle-90;
}else if obj_player.sniper_gun.spread_number = 3 {
	if spread_index = 0 {
		image_angle = obj_player.image_angle-90-obj_player.sniper_gun.spread_angle;
	}else if spread_index = 1 {
		image_angle = obj_player.image_angle-90;
	}else if spread_index = 2 {
		image_angle = obj_player.image_angle-90+obj_player.sniper_gun.spread_angle;
	}
}
attach_to_player = 0;

sniped_array = [];
boss_projectile=false;
hspd = 0;
vspd = 0;