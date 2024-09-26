/// @description Twist nearest fan to point towards this object
if instance_exists(obj_env_fan) {
	nearest_fan = instance_nearest(x,y,obj_env_fan);
}else {
	nearest_fan = noone;
}

if(nearest_fan != noone)
{
	angle = point_direction(x,y,nearest_fan.x, nearest_fan.y);
	nearest_fan.image_angle = angle + 180;
	//nearest_fan.air.image_angle = nearest_fan.image_angle; //Also change the fan's air object direction
}


