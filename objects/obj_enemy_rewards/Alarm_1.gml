/// @description finding path

is_moving = true;


//custom the path we watn
while (!found) {
target_x = irandom(room_width - 1); 
target_y = irandom(room_height - 1); 

// not on wall
  if (instance_position(target_x, target_y, obj_ground) == noone) {
	  //escape from player
	  if(((obj_player.x <= x and obj_player.x <= target_x) or (obj_player.x > x and obj_player.x > target_x)) and ((obj_player.y <= y and obj_player.y <= target_y) or (obj_player.y > y and obj_player.y > target_y)))
        found = true; 
    }
}

mp_grid_path(obj_setup_pathway.grid_follow,follow_path,x,y,target_x,target_y,true);

path_start(follow_path,1,path_action_stop,true);

