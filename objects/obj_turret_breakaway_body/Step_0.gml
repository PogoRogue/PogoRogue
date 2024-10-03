vspd += grav;
x += hspd;
y += vspd;
if y > init_y + 700 {
	instance_destroy();	
}