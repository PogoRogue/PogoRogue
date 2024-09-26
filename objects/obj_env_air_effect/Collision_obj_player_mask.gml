/// @description Change velocity of player
affect_hspeed = cos(image_angle * pi / 180);
affect_vspeed = -sin(image_angle * pi / 180);

if(power_weakens_on_distance)
{
	if other.parent_index.hspeed * sign(affect_hspeed) < 6 {
		other.parent_index.hspeed += air_strength * affect_hspeed * (point_direction(x,y,other.parent_index.x,other.parent_index.y)/sprite_width);
		if image_angle % 360 = 0 or image_angle % 360 = 180 {
			air_strength = 0.05;
			other.parent_index.vspeed *= 0.95;
		}
	}
	if other.parent_index.vspeed * sign(affect_vspeed) < 8 {
		other.parent_index.vspeed += air_strength * affect_vspeed * (point_direction(x,y,other.parent_index.x,other.parent_index.y)/sprite_width);
		if image_angle % 360 = 90 {
			air_strength = 0.5;
			other.parent_index.hspeed *= 0.95;
		}
		if image_angle % 360 = 270 {
			air_strength = 0.05;
			other.parent_index.hspeed *= 0.95;
		}
	}
}
else
{
	if other.parent_index.hspeed * sign(affect_hspeed) < 6 {
		other.parent_index.hspeed += air_strength * affect_hspeed;
		if image_angle % 360 = 0 or image_angle % 360 = 180 {
			air_strength = 0.05;
			other.parent_index.vspeed *= 0.95;
		}
	}
	if other.parent_index.vspeed * sign(affect_vspeed) < 8 {
		other.parent_index.vspeed += air_strength * affect_vspeed;
		if image_angle % 360 = 90 {
			air_strength = 0.5;
			other.parent_index.hspeed *= 0.95;
		}
		if image_angle % 360 = 270 {
			air_strength = 0.05;
			other.parent_index.hspeed *= 0.95;
		}
	}
}