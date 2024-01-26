var key_enter = keyboard_check_pressed(vk_enter);
if (place_meeting(x,y,player) && global.pistola = false)
{
	draw_sprite(s_compra_arma,0,640,360);	
	if (global.n_moedas>= 50 && key_enter)
	{
		global.pistola = true;
		global.n_moedas= global.n_moedas -50;
	}
}

if place_meeting(x,y,player) && global.pistola = true
{
	draw_sprite(s_Como_disparar,0,640,360);
}



