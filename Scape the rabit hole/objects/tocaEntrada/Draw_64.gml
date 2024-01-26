var key_cima     = keyboard_check_pressed(vk_up);
var key_baixo    = keyboard_check_pressed(vk_down);

if place_meeting(x,y,player) 
{
	global.pause = true;
	if global.level < prox_level then global.level = prox_level;
	
	if room != Exterior
	{
		draw_sprite(s_continuar,0,640,360);
		if keyboard_check_pressed(ord(1)) 
		{
			global.pause = false;
			room_goto(targetRoom);
			player.x = targetx;
			player.y = targety;
		}
	
		if keyboard_check_pressed(ord(2))
		{
			global.pause = false;
			room_goto(Exterior);
			player.x = 280;
			player.y = 640;
		}
	}
	else 
	{
		draw_sprite(Sprite37,level_selec -1,640,360);
		if key_baixo 
		{
			if level_selec <7
			{
				level_selec = level_selec +1;
			}
			else level_selec = 1;
		}
			
		if key_cima  
		{
			if level_selec >1
			{
				level_selec = level_selec -1;
			}
			else level_selec = 7;
		}
	
		if keyboard_check_pressed(vk_enter)
		{
			if level_selec == 1
			{
				global.pause = false;
				room_goto(Caverna_1);
				player.x = 100;
				player.y = 100;
			}
			
			if level_selec == 2 && global.level >= 2
			{
				global.pause = false;
				room_goto(Caverna_2);
				player.x = 1200;
				player.y = 150;
			}

			if level_selec == 3 && global.level >= 3
			{
				global.pause = false;
				room_goto(Caverna_3);
				player.x = 100;
				player.y = 150;
			}
		}
	}
}