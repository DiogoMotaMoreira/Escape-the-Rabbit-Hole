if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_down))
{
	if image_index == 0
	{
		image_index = 1;	
	}
	else image_index = 0;
}

if keyboard_check_pressed(vk_enter)
{
	if image_index == 0
	{
		room = Exterior;	
	}
	else game_end();
}





