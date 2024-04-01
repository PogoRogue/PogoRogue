/// @description Initiate variables
// Inherit the parent event
event_inherited();

distance = 700;
angle_accelerration = 0;
angle_velocity = 0;
angle = -67;
anchor_x = x;
anchor_y = y - distance;
swingspeed = -0.02;
oscillation = 0;
spring_force = 0;
damping = 0.99;
hsp = 0;
vsp = 0;
collision_detected = false;

//When taking specific action, stop normal movement
special_action="NO";
// "NO"= normal 
//"ground_pound"=ground pound 
//"return"=return to original position
orig_x=x;
orig_y=y;

// HP
draw_hp = false;
hp = 500;
previous_hp = hp;
is_hurt = false;
hp_max = hp;
hp_percent = (hp / hp_max) * 100;

// Healthbar dimensions
view_width = camera_get_view_width(view_camera[0]);
view_height = camera_get_view_height(view_camera[0]);
top_border = view_height - 20;
boss_name = "Rogo Marionette";

// Limbs
instance_create_depth(x + 40, y, depth - 1, obj_boss_marionette_arm, {length_diff: 40, angle_diff: 42});
instance_create_depth(x - 40, y, depth - 1, obj_boss_marionette_arm, {length_diff: 40, angle_diff: 138});

instance_create_depth(x, y, -20, obj_boss_marionette_health);
