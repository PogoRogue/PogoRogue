/// @description 

lerp_destination = draw_cutin ? 1.0 : 0.0;

alpha = lerp(backdrop_scale, lerp_destination, alpha_lerp_speed);
backdrop_scale = lerp(backdrop_scale, lerp_destination, backdrop_lerp_speed);
text_scale = lerp(text_scale, lerp_destination, text_lerp_speed);
