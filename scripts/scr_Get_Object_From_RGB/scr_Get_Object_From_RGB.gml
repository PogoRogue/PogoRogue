///@description Correlates an RGB to a Pogo Rogue object, returning the object index
function scr_Get_Object_From_RGB(Red, Green, Blue, Alpha){
	//Object categories:
	//White = player start location
	//Red = enemy	
	//Green = item
	//Blue = environmental hazard
	//Black/Brown = ground
	
	if(Alpha == 0) //Transparent pixel IE generate nothing!
	{
	return -1;
	}
	else if(Red == 242 && Green == 101 && Blue == 34)
	{
		return obj_tag_Isaac;
	}
	else if(Red == 187 && Green == 228 && Blue == 76)
	{
		return obj_tag_Cam;
	}
	else if(Red == 34 && Green == 204 && Blue == 0)
	{
		return obj_tag_Sam;
	}
	else if(Red == 17 && Green == 69 && Blue == 20) //Insert Talon signature color here
	{
		return obj_tag_Zehao;
	}
	else if(Red == 250 && Green == 115 && Blue == 255)
	{
		return obj_tag_Talon; // Insert Talon signature color here
	}
	else if(Red == 213 && Green == 110 && Blue == 5)
	{
		return obj_pixel_tag; //Default tag color for testing purposes
	}
	else if(Red == 255 && Green == 255 && Blue == 255) //White = player start location
	{
		return obj_player_start;
	}
	else if(Red > 150) //This space of colors is designated for enemies
	{
		if(Green < 50)
		{
			if(Red == 255)
			{
				return Get_Random_Enemy();
			}
			else if(Red > 228)
			{			
				return obj_enemy_flying;
			}
			else if(Red > 203)
			{		
				//return obj_enemy_stomp_only;
				return obj_enemy_stomp_only_moving;
			}
			else if(Red > 179)
			{
				return obj_enemy_snail;
			}
			else if(Red > 177)
			{
				//return obj_enemy_shoot_only;
				return obj_enemy_shoot_only_jumping;
			}
			else if(Red > 150)
			{
				return obj_enemy_shooter;
				//return obj_enemy_shooter_moving;
			}
		}
		else if(Green >= 50)
		{
			if(Red > 240)
			{
				return obj_enemy_moving;
			}
			else if(Red > 230)
			{
				return obj_miniboss_cube;
			}
			else if(Red > 220)
			{
				//return obj_enemy_explode;
				return obj_enemy_explode_walking;
			}
			else if(Red > 200)
			{
				return obj_enemy_stomp_only_moving;
			}
			else if(Red > 179)
			{
				return obj_enemy_whack_a_vole;
			}
			else if(Red > 170)
			{
				return obj_enemy_turret;
			}
			else if(Red > 160)
			{
				return obj_enemy_turret_mobile;
			}
			else if(Red > 150)
			{
				return obj_enemy_moving_jumping;
			}
		}
	}
	else if(Green > 150) //These are items!
	{
		if(Green == 255)
		{
			return obj_chest;
		}
		else if(Green > 228)
		{
			return obj_shop_door;
		}
		else if(Green > 200)
		{
			return obj_boss_door;
		}
		
	}
	else if(Blue > 150) //These are environmental hazards!
	{
		if(Blue == 255 && Green == 150)
		{
			return obj_fan_pointer;
		}
		else if(Blue == 255)
		{
			return obj_env_fan;
		}
		else if(Blue == 225 && Green == 75)
		{
			return obj_temp_platform_off_on;
		}
		else if(Blue == 225 && Green == 0)
		{
			return obj_temp_platform_on_off;
		}
		else if(Blue == 204)
		{
			return obj_conveyor_belt;
		}
		else if(Blue == 178)
		{
			return obj_electric_current;
		}
		else if(Blue == 200)
		{
			return obj_pinballbumper;
		}
		else if(Blue == 155)
		{
			return obj_spike;
		}
		else if(Blue == 220)
		{
			return obj_spikeblock;
		}
		else if(Blue == 151)
		{
			return obj_spikeswing;
		}
		else if(Blue == 152)
		{
			return obj_spring;
		}
		else if(Blue == 206)
		{
			return obj_movingplatform_horizontal;
		}
		
	}
	else //All other colors are ground/unassigned
	{
		if(Red == 0)
		{
			return obj_ground_outer;
		}
		else if(Red > 140)
		{
			return obj_ground_oneway;
		}
		else if(Red == 75 && Green == 75 && Blue == 75)
		{
			return obj_angled_platform_left;
		}
		else if(Red == 50 && Green == 50 && Blue == 50)
		{
			return obj_angled_platform_right;
		}
			else if(Red == 25 && Green == 25 && Blue == 25)
		{
			return obj_instructions;
		}
	}
	
	//Color had no matches, generate nothing
	return -1;
	
}

function Get_Random_Enemy()
{	
	return choose(obj_enemy_explode, obj_enemy_flying, obj_enemy_moving, obj_enemy_shoot_only,
		obj_enemy_shooter, obj_enemy_stomp_only, obj_enemy_chasing);
}