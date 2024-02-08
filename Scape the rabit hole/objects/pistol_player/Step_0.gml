var key_tiro = keyboard_check_pressed(ord("X"));


if global.armado == true && global.n_municao > 0
{
	visible = true;
	image_xscale = player.image_xscale;
	x = player.x + (5*image_xscale);
	y = player.y -17;
	if key_tiro 
	{
		image_speed = 1;
	}
	else if image_index = 0 then image_speed = 0;
	
}
else visible = false;






