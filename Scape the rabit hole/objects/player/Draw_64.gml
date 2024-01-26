#region Vida
if (global.hp <= 0)
{
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

if global.pause == true
{
	
}
#endregion



