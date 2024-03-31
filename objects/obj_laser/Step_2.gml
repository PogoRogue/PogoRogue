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

//change sprite after animation complete
if (floor(image_index) = sprite_get_number(sprite_index)-1) {
	sprite_index = full_sprite;
	mask_index = sprite_index;
}