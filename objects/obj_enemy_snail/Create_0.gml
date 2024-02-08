/// @description Instantiate variables

// Inherit the parent event
event_inherited();


if(image_angle = 0){
	state = "horizontal";
	//this.image_angle = 0;
	which_wall = "none";
}
else if(image_angle = 90 or image_angle = -90 ){
	state = "vertical";
	if(image_angle = -90)
		{
			which_wall ="left";
			
	}
		
	if(image_angle = 90)
		{
			which_wall ="right";
	}
		
}





// Instantiate additional variables
spd = 0.5;
at_edge = false;
at_wall = false;
