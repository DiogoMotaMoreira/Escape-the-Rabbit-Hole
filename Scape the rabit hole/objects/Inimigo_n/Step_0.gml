if global.pause == false
{
	if (player.y <= y+30 && player.y >= y-30) && (player.x <= x+200 && player.x >= x-200) 
	{
		ataque = true; 
		if (player.x > x && hsp < 0) || (player.x < x && hsp > 0) then hsp = -hsp;
	}
	
	if ataque == false
	{
		#region Movimentos
		vsp = vsp + grv;
	
		// Movimento Normal --------------------------------------------------

		// colisao horizontal -- movimento 

		if (place_meeting(x+hsp,y,toca_parede) || place_meeting(x+hsp,y,toca_chao) || place_meeting(x+hsp,y,toca_teto))
		{
			while (!place_meeting(x+sign(hsp),y,toca_parede) && (!place_meeting(x+sign(hsp),y,toca_chao)) && (!place_meeting(x+sign(hsp),y,toca_teto))) // sign é mais um ou menos um dependendo do sinal
			{
				x = x + sign(hsp);
			}
			hsp = -hsp;
		}


		// colisao vertical -- gravidade
		if (place_meeting(x,y+vsp,toca_chao) || place_meeting(x,y+vsp,toca_parede) || place_meeting(x,y+vsp,toca_teto))
		{
			while (!place_meeting(x,y+sign(vsp),toca_chao) && (!place_meeting(x,y+sign(vsp),toca_parede)) && (!place_meeting(x,y+sign(vsp),toca_teto))) 
			{
				y = y + sign(vsp);
			}
			vsp = 0;
		}
	
		//Saltar
		if (place_meeting(x,y+1,toca_chao)) then vsp = salto;


		x = x + hsp;
		y = y + vsp;

		#endregion

		#region Imagens
		// imagens 
		image_xscale = -sign(hsp);

		if (!place_meeting (x,y+1, toca_chao))
		{ 
			sprite_index = sInimigo_normal;
		    image_index = 0;
		}
		else 
		{
			sprite_index =sInimigo_normal;
			image_index = 1;
		}
		#endregion
	}
	else
	{
		#region Movimentos
		vsp = vsp + grv;

		if (place_meeting(x+hsp,y,toca_parede) || place_meeting(x+hsp,y,toca_chao) || place_meeting(x+hsp,y,toca_teto))
		{
			while (!place_meeting(x+sign(hsp),y,toca_parede) && (!place_meeting(x+sign(hsp),y,toca_chao)) && (!place_meeting(x+sign(hsp),y,toca_teto))) // sign é mais um ou menos um dependendo do sinal
			{
				x = x + sign(hsp);
			}
			hsp = -hsp;
			ataque = false;
		}


		// colisao vertical -- gravidade
		if (place_meeting(x,y+vsp,toca_chao) || place_meeting(x,y+vsp,toca_parede) || place_meeting(x,y+vsp,toca_teto))
		{
			while (!place_meeting(x,y+sign(vsp),toca_chao) && (!place_meeting(x,y+sign(vsp),toca_parede)) && (!place_meeting(x,y+sign(vsp),toca_teto))) 
			{
				y = y + sign(vsp);
			}
			vsp = 0;
		}

		x = x + hsp;
		y = y + vsp;

		#endregion
		
		#region Imagens
		// imagens 
		image_xscale = -sign(hsp);

			sprite_index = sInimigo_ataque;
		    image_index = 0;
		#endregion
	}
	
}
else image_speed = 0;