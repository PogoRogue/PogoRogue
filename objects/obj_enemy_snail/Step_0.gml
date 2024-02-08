/// @description Move left and right

// Inherit the parent event
event_inherited();


if(state == "horizontal"){
// Move left and right
which_wall = "none";
at_edge = !collision_point(x + (sign(spd)), y + (sprite_height / 2), obj_ground_parent, false, false); 
at_wall = place_meeting(x + spd, y, obj_ground_parent);

//sprite_index = spr_WalkEnemy_Walk;

if (at_edge or at_wall) {
	spd *= -1;
	//sprite_index = spr_WalkEnemy_Idle;
}
if (spd == 0.5) { image_xscale = 1;}
if (spd == -0.5) { image_xscale = -1;}

if(is_dead) {
	spd = 0;	
}

x += spd;


if (alarm[1] < 0) {
		  alarm[1] = room_speed * 0.05 ;
		}

}

if(state == "vertical"){
// Move left and right
if(which_wall = "left"){
	at_edge = !collision_point(x -  (sprite_height / 2), y +(sign(spd)), obj_ground_parent, false, false); 
}
else if(which_wall = "right"){
	at_edge = !collision_point(x + (sprite_height / 2), y +(sign(spd)), obj_ground_parent, false, false); 
}

at_wall = place_meeting(x, y + spd, obj_ground_parent);

//sprite_index = spr_WalkEnemy_Walk;

if (at_edge or at_wall) {
	spd *= -1;
	//sprite_index = spr_WalkEnemy_Idle;
}
if (spd == 0.5) { image_xscale = 1;}
if (spd == -0.5) { image_xscale = -1;}

if(is_dead) {
	spd = 0;	
}

y += spd;


if (alarm[2] < 0) {
		  alarm[2] = room_speed * 0.05 ;
		}

}