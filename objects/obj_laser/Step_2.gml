/// @description Insert description here
// You can write your code in this editor
x = obj_player.x+lengthdir_x(32*instance,obj_player.image_angle-90);
y = obj_player.y+lengthdir_y(32*instance,obj_player.image_angle-90);

image_angle = obj_player.image_angle-90;

//retract laser
if (floor(image_index) = 0 and image_speed = -1) {
	instance_destroy();
}

//cant damage enemies if out of view
if instance_exists(obj_camera) {
	camera_width = camera_get_view_width(view_camera[0])/2;
	camera_height = camera_get_view_height(view_camera[0])/2;
	var padding = 128;

	if !(point_in_rectangle(x,y,obj_camera.x-camera_width-padding,obj_camera.y-camera_height-padding,obj_camera.x+camera_width+padding,obj_camera.y+camera_height+padding)) {
		damage = 0;
	}else {
		damage = init_damage;	
	}
}

if place_meeting(x,y,obj_enemy_parent) {
	with instance_place(x,y,obj_enemy_parent) {
		with other {
			if(!other.invinsible) {
			    var laser_damage = 0.9; //apply damage buff differently for laser
				var slime_damage = 0.7; //apply damage buff differently for slime
				if(!other.is_dead) {
					other.hp -= (damage + global.damage_buff - (global.damage_buff * laser_damage * (gun_name = "Laser Gun" and global.damage_buff > 0)) - (global.damage_buff * slime_damage * (gun_name = "Slime Blaster" and global.damage_buff > 0))) * other.bullet_defense;
					other.red_frames = 10;
	
					scr_Reload_On_Kill();
		
				}

				if (destroy_on_impact) or (gun_name = "Missile Launcher") or (gun_name = "Bullet Blast") or (gun_name = "Javelins") {
					instance_destroy();
				}

				colliding_with_enemy = true;
			}
		}
	}
}

//change sprite after animation complete
if (floor(image_index) = sprite_get_number(sprite_index)-1) {
	sprite_index = full_sprite;
	mask_index = sprite_index;
}