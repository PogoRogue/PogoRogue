///@description Correlates an RGB to a Pogo Rogue object, returning the object index
function scr_Get_Object_From_RGB(Red, Green, Blue, Alpha){
	//Object categories:
	//Red = enemy	
	//Green = item
	//Blue = environmental hazard
	//Black/Brown = ground
	
	if(Alpha == 0) //Transparent pixel IE generate nothing!
	{
	return -1;
	}
	else if(Red > 150) //This space of colors is designated for enemies
	{
		if(Green < 50)
		{
			if(Red == 255)
			{
				return get_random_enemy();
			}
			else if(Red > 228)
			{			
				return obj_enemy_flying;
			}
			else if(Red > 203)
			{		
				return obj_enemy_stomp_only;
			}
			else if(Red > 177)
			{
				return obj_enemy_shoot_only;
			}
			else if(Red > 150)
			{
				return obj_enemy_shooter;
			}
		}
		else if(Green >= 50)
		{
			if(Red > 240)
			{
				return obj_enemy_moving
			}
			else
			{
				return obj_enemy_explode
			}
		}
	}
	else if(Green > 150) //These are items!
	{

	}
	else if(Blue > 150) //These are environmental hazards!
	{
		if(Blue == 255 && Green == 150)
		{
			return obj_fan_pointer;
		}
		else if(Blue > 250)
		{
			return obj_env_fan;
		}
		else if(Blue > 200)
		{
			return obj_conveyor_belt;
		}
		else
		{
			
		}
	}
	else //All other colors are ground/unassigned
	{
		if(Red < 10)
		{
			return obj_ground;
		}
		else if(Red > 10)
		{
			return obj_ground_oneway;
		}
	}
	
	//Color had no matches, generate nothing
	return -1;
	
}

function get_random_enemy()
{	
	return choose(obj_enemy_explode, obj_enemy_flying, obj_enemy_moving, obj_enemy_shoot_only,
		obj_enemy_shooter, obj_enemy_stomp_only);
}