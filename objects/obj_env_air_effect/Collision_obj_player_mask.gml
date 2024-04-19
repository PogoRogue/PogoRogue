/// @description Change velocity of player
affect_hspeed = cos(image_angle * pi / 180);
affect_vspeed = -sin(image_angle * pi / 180);

if(power_weakens_on_distance)
{
	if other.parent_index.hspeed * sign(affect_hspeed) < 7 {
		other.parent_index.hspeed += air_strength * affect_hspeed * (point_direction(x,y,other.parent_index.x,other.parent_index.y)/sprite_width);
	}
	if other.parent_index.vspeed * sign(affect_vspeed) < 7 {
		other.parent_index.vspeed += air_strength * affect_vspeed * (point_direction(x,y,other.parent_index.x,other.parent_index.y)/sprite_width);
	}
}
else
{
	if other.parent_index.hspeed * sign(affect_hspeed) < 7 {
		other.parent_index.hspeed += air_strength * affect_hspeed;
	}
	if other.parent_index.vspeed * sign(affect_vspeed) < 7 {
		other.parent_index.vspeed += air_strength * affect_vspeed;
	}
}