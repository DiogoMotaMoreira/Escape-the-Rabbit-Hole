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
if (sign(hsp) = 1)
{
	image_xscale = -1;
}
else image_xscale = 1;

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