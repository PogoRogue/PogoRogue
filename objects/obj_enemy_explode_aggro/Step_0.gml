/// @description Move left and right

// Inherit the parent event
event_inherited();
dist_to_player = distance_to_object(player);
if(dist_to_player<aggro_range&&aggro==false){
  aggro=true;
  alarm_set(2,room_speed*2);
  instance_create_layer(x, y-30, "Instances", obj_aggro);
}
// Move left and right
at_edge = !collision_point(x + (sign(hspeed) * 16), y + (sprite_height / 2), obj_ground_parent, false, false) && place_meeting(x, y + 1, obj_ground_parent); 
at_wall = place_meeting(x + hspeed, y, obj_ground_parent);

if (!is_dead) {
	sprite_index = spr_enemy_walking_explosion_walk;
}


if(is_dead) {
	speed = 0;
	if (sprite_index == spr_enemy_walking_explosion_walk) {
		image_index = 0;
		sprite_index = spr_enemy_walking_explosion;
	}
}else{
	
    if(aggro=false){
		if (at_edge or at_wall) {
	        spd*= -1;
        }
        hspeed=spd;
    }else{
	    at_edge = (!collision_point(x + (sprite_width / 2), y + (sprite_height / 2), obj_ground_parent, false, false))or (!collision_point(x - (sprite_width / 2), y + (sprite_height / 2), obj_ground_parent, false, false)); 
at_wall = (collision_point(x + (sprite_width / 2), y , obj_ground_parent, false, false))or (collision_point(x - (sprite_width / 2), y , obj_ground_parent, false, false)); 
on_ground = instance_place(x,y+1,obj_ground);
end_chasing = false;
edge_side = 0; //left is 0,right is 1; left has wall is 2,right has wall is 3

//left edge
if(at_edge and collision_point(x + sprite_width / 2, y + (sprite_height / 2), obj_ground_parent, false, false)){
	edge_side = 0;
}	
//right edge
else if(at_edge and collision_point(x - sprite_width / 2, y + (sprite_height / 2), obj_ground_parent, false, false)){
	edge_side = 1;
}

//left has wall
else if(at_wall and collision_point(x - sprite_width / 2, y - (sprite_height / 2), obj_ground_parent, false, false)){
	edge_side = 2;
}
else if(at_wall and collision_point(x + sprite_width / 2, y - (sprite_height / 2), obj_ground_parent, false, false)){
	edge_side = 3;
}




var player_instance = instance_nearest(x, y, obj_player);

if(at_edge or at_wall){
	if(distance_to_object(player_instance)<100){
		end_chasing = true;
		if(edge_side = 0 or edge_side=2){
			if(player_instance.x - x > 0){
			
				chase_spd=2;
				hspeed= chase_spd;
			}
				
			else if (player_instance.x - x < 0){
				chase_spd = 0;
			}
		}
		else{
			if(player_instance.x - x > 0){
				chase_spd = 0;
				
			}
				
			else if (player_instance.x - x < 0){
				
				chase_spd=-2;
				hspeed= chase_spd;
			}
		}
		
	}
	
	else if(distance_to_object(player_instance)>100){
			if(edge_side = 0 or edge_side=2){
			chase_spd=2;
			hspeed=chase_spd;
		}
		else{
			chase_spd=-2;
			hspeed= chase_spd;
			}
		}
}
	
else if(!at_edge and !at_wall){
	if(distance_to_object(player_instance)<100){
		if(player_instance.x - x > 0){
			chase_spd = 2;
			hspeed= chase_spd;
			end_chasing = true;
		}
		else if(player_instance.x - x < 0){
			chase_spd = -2;
			hspeed= chase_spd;
		}
	}
	else if(distance_to_object(player_instance)>100){
		if(end_chasing){
		if(player_instance.x - x > 0){
			chase_spd = -2;
			end_chasing = false;
		}
		else if(player_instance.x - x < 0){
			chase_spd = 2;
			end_chaing = false;
		}
		
		}
		hspeed= chase_spd;
	}
	

}
if(dist_to_player<50){
instance_destroy();
}
    }
}

if sprite_index = spr_enemy_walking_explosion {
	if scr_Animation_Complete() {
		instance_destroy();	
	}
}
image_alpha = 1.0;


// Move to top of surface if stuck in floor
while(place_meeting(x, y, obj_ground_parent)) {
	y--;
}	
