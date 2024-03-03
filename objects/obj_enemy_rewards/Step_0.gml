/// @description Fly back and forth

// Inherit the parent event

event_inherited();

d = point_distance(x,y,obj_player.x,obj_player.y);


//show_message(d);
if (d < 100 &&  is_moving == false){
	follow_path = path_add();
	
    alarm[1] = 1;
  
}

if(x == target_x and y == target_y){
		
		alarm[0]=1;
	}
