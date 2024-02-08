#region Vida
if (global.hp <= 0)
{
	global.pause = true;
	draw_sprite(s_telaMorte,0,640,360);
	
	if keyboard_check_pressed(ord(1)) && global.n_moedas >= 100
	{
		room_goto(Exterior);
		x = 280;
		y = 640;
		global.n_moedas = global.n_moedas - 100;
		global.hp = 3;
	}
	
	if keyboard_check_pressed(ord(2))
	{
		game_end();	
	}
}
#endregion

if global.menu_pause == true
{
	draw_sprite(s_pause,0,640,360);
		if keyboard_check_pressed(ord(1)) 
		{
			global.pause = false;
			global.menu_pause = false;
		}
	
		if keyboard_check_pressed(ord(2))
		{
			global.pause = false;
			global.menu_pause = false;
			room_goto(Exterior);
			player.x = 280;
			player.y = 640;
		}
		if keyboard_check_pressed(ord(3))
		{
			if (file_exists("save.sav")) then file_delete("save.sav");
			ini_open("save.sav");
			ini_write_real("Jogador","Vida",global.hp);
			ini_write_real("Jogador","Nível máximo",global.level);
			ini_write_string("Jogador","Pistola",global.pistola);
			ini_write_string("Jogador","Armado",global.armado);
			ini_write_real("Jogador","Munição",global.n_municao);
			ini_write_real("Jogador","Moedas",global.n_moedas);
			ini_close();
			// colocar imagem de jogo salvo
		}
		if keyboard_check_pressed(ord(4))
		{
			game_end();
		}
}


