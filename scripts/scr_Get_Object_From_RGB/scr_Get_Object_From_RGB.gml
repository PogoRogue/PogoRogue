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
	else if(Red == 102 && Green == 3 && Blue == 252)
	{
		return obj_tag_Ian;
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
			else if(Red > 245)
			{			
				return obj_enemy_fairy;
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
			}else if(Red > 170)
			{
				//return obj_enemy_shoot_only;
				return obj_enemy_bat;
			}else if(Red > 165)
			{
				return obj_cubeenemy;
				//return obj_enemy_shooter_moving;
			}
			else if(Red > 160)
			{
				return obj_cubeenemy_double;
				//return obj_enemy_shooter_moving;
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
			else if(Red > 235)
			{			
				return obj_enemy_car;
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
				return obj_enemy_shooter_moving;
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
				return obj_enemy_moving2;
			}
		}
	}
	else if(Green > 150) //These are items!
	{
		if(Green == 255)
		{
			return obj_chest;
		}
		else if Green > 239 {
			return obj_chest_combat;
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
		else if(Blue == 203)
		{
			return obj_conveyor_belt_mirrored;
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
			return obj_spikeblock; //down
		}
		else if(Blue == 215)
		{
			return obj_spikeblock_up; //up
		}
		else if(Blue == 210)
		{
			return obj_spikeblock_right; //right
		}
		else if(Blue == 205)
		{
			return obj_spikeblock_left; //left
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
		else if(Red == 55 && Green == 55 && Blue == 55)
		{
			return obj_button;
		}
		else if(Red == 50 && Green == 50 && Blue == 50)
		{
			return obj_angled_platform_right;
		}
		else if(Red == 45 && Green == 45 && Blue == 45)
		{
			return obj_room_gate_open_starting;
		}
		else if(Red == 40 && Green == 40 && Blue == 40)
		{
			return obj_salesman_table;
		}
		else if(Red == 35 && Green == 35 && Blue == 35)
		{
			return obj_pogosmith_table;
		}
		else if(Red == 30 && Green == 30 && Blue == 30)
		{
			return obj_room_gate_open_shop;
		}
		else if(Red == 25 && Green == 25 && Blue == 25)
		{
			//return obj_instructions;
		}
		else if(Red == 20 && Green == 20 && Blue == 20)
		{
			return obj_pickup_station;
		}
		else if(Red == 15 && Green == 15 && Blue == 15)
		{
			return obj_ground_shopcoverup;
		}
		else if(Red == 12 && Green == 12 && Blue == 12)
		{
			return obj_ground_bosscoverup;
		}
		else if(Red == 10 && Green == 10 && Blue == 10)
		{
			return obj_table_selection;
		}
		else if(Red == 5 && Green == 5 && Blue == 5)
		{
			return obj_seeding_station;
		}else if (Red == 4 && Green == 4 && Blue == 4) {
			return obj_camera_constrain_y_bottom_long;
		}
		else if(Red == 3 && Green == 3 && Blue == 3)
		{
			return obj_room_gate_open; 
		}
		else if(Red == 2 && Green == 2 && Blue == 2)
		{
			return obj_shop_indicator; //fix minimap bug
		}
		else if(Red == 1 && Green == 1 && Blue == 1)
		{
			return obj_shop_indicator2; //fix minimap bug
		}else if (Red == 102 && Green == 45 && Blue == 145)
		{
			return obj_background_junk; 
		}else if (Red == 46 && Green == 49 && Blue == 146)
		{
			return obj_background_office;
		}else if (Red == 29 && Green == 74 && Blue == 28)
		{
			randomize();
			var random_crate = choose(obj_crate1,obj_crate1);
			random_set_seed(global.seed);
			return random_crate;
		}else if (Red == 10 && Green == 64 && Blue == 60)
		{
			return obj_crate3;
		}else if (Red == 10 && Green == 64 && Blue == 60)
		{
			return obj_crate3;
		}else if (Red == 50 && Green == 50 && Blue == 97)
		{
			return obj_office_table;
		}else if (Red == 85 && Green == 30 && Blue == 125)
		{
			return obj_randomasset2;
		}else if (Red == 39 && Green == 101 && Blue == 114)
		{
			return obj_randomasset1;
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