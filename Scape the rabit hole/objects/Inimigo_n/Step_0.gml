vsp = vsp + grv;


// Atacar Jogador ------------------------------------------------------------
if (y >= player.y && y <= (player.y +20)) && (player.x < x+150) && (player.x > x-150)
{
	// Gravidade
	if (place_meeting(x,y+vsp,chao) || place_meeting(x,y+vsp,parede) || place_meeting(x,y+vsp,teto))
	{
		while (!place_meeting(x,y+sign(vsp),chao) && (!place_meeting(x,y+sign(vsp),parede)) && (!place_meeting(x,y+sign(vsp),teto))) 
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	
	// dar direção virada para jogador
	if (player.x < x && sign(hsp) != (-1)) || (player.x > x && sign(hsp) != 1 ) then hsp = -hsp; 
	
	// condição para lhe dar o movimento até a colisão
	if  (place_meeting(x+sign(hsp),y,player))
	{
		while (!place_meeting(x+sign(hsp),y,player)) 
		{
			x = x + sign(hsp);
		}  
	}
}
else 
{
	// Movimento Normal --------------------------------------------------
	
	// colisao horizontal -- movimento 
	
	
	
	if (place_meeting(x+hsp,y,parede) || place_meeting(x+hsp,y,chao) || place_meeting(x+hsp,y,teto))
	{
		while (!place_meeting(x+sign(hsp),y,parede) && (!place_meeting(x+sign(hsp),y,chao)) && (!place_meeting(x+sign(hsp),y,teto))) // sign é mais um ou menos um dependendo do sinal
		{
			x = x + sign(hsp);
		}
		hsp = -hsp;
	}


	// colisao vertical -- gravidade
	if (place_meeting(x,y+vsp,chao) || place_meeting(x,y+vsp,parede) || place_meeting(x,y+vsp,teto))
	{
		while (!place_meeting(x,y+sign(vsp),chao) && (!place_meeting(x,y+sign(vsp),parede)) && (!place_meeting(x,y+sign(vsp),teto))) 
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	
	//Saltar
	if (place_meeting(x,y+1,chao)) then vsp = salto;

	// ------------------------------------------------------------------------------
}

x = x + hsp;
y = y + vsp;

// imagens 
if (sign(hsp) = 1)
{
	image_xscale = -1;
}
else image_xscale = 1;

if (!place_meeting (x,y+1, chao))
{ 
	sprite_index = sInimigo_normal;
    image_index = 0;
}
else 
{
	sprite_index =sInimigo_normal;
	image_index = 1;
}

if (y >= player.y && y <= (player.y +20)) && (player.x < x+150) && (player.x > x-150)
{
	sprite_index = sInimigo_ataque;
}