if (file_exists("save.sav"))
{
	sprite_index = s_MI_2;
}
else 
{
	sprite_index = s_MI;
}

if sprite_index == s_MI_2
{
	
	if (keyboard_check_pressed(vk_up))
	{
		image_index --;
	}
	if (keyboard_check_pressed(vk_down))
	{
		image_index ++;
	}
	
	if keyboard_check_pressed(vk_enter)
	{
		
		if image_index == 0
		{
			room = Exterior;
			global.loadgame = false;
			
		}
		if image_index == 1
		{
			room = Exterior;
			global.loadgame = true;
		}
		if image_index == 2
		{
			game_end();	
		}
	}
}

if sprite_index == s_MI
{
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
		if image_index == 1
		{
			game_end();	
		}
	}
}




