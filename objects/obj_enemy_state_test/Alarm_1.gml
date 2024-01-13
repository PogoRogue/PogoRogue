/// @description Swamp state
// You can write your code in this edito
  is_flying=!is_flying;
  invinsible=!invinsible;
//then if turned to flying, fly up
if(is_flying){
vspeed=-2;
alarm_set(2,room_speed/2);
}
alarm_set(1,room_speed*4)
