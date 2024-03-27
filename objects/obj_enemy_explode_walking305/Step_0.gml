/// @description Move left and right

// Inherit the parent event
event_inherited();
dist_to_player = distance_to_object(player);
if(dist_to_player<aggro_range){
  aggro=true;
  alarm_set(2,room_speed*3);
}
// Move left and right
at_edge = !collision_point(x + (sign(hspeed) * 16), y + (sprite_height / 2), obj_ground_parent, false, false) && place_meeting(x, y + 1, obj_ground_parent); 
at_wall = place_meeting(x + hspeed, y, obj_ground_parent);

if (!is_dead) {
	sprite_index = spr_enemy_walking_explosion_walk;
}


if (hspeed>=0) { image_xscale = 1;}
if (hspeed<0) { image_xscale = -1;}

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
	    if(player.x<x){
		    chase_spd=-chase_spd;
	    }
	    hspeed=chase_spd;
	    if(dist_to_player<20){
		    alarm_set(2,1);
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
