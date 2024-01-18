key_esquerda = keyboard_check(vk_left);
key_direita  = keyboard_check(vk_right); // dá valor de 1 ou 0 quando presionado
key_cima     = keyboard_check(vk_up);
key_baixo    = keyboard_check(vk_down);
key_salto    = keyboard_check(vk_space);

var move = key_direita - key_esquerda; // para quando precionamos ambas as teclas sair movimento fluido

// velocidades
hsp = move  * walksp;

vsp = vsp + grv;

// Salto
if ((place_meeting(x,y+1,chao)) && (key_salto)) // 8 é o ponto minimo a adicionar para detetar teto a um bloco em cima
{
	vsp = salto; 
}


// colisao parede horizontal
if (place_meeting(x+hsp,y,parede) || place_meeting(x+hsp,y,chao) || place_meeting(x+hsp,y,teto))
{
	while (!place_meeting(x+sign(hsp),y,parede) && (!place_meeting(x+sign(hsp),y,chao)) && (!place_meeting(x+sign(hsp),y,teto))) // sign é mais um ou menos um dependendo do sinal
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x +hsp;


// colisão chão/teto -- Gravidade
if (place_meeting(x,y+vsp,chao) || place_meeting(x,y+vsp,parede) || place_meeting(x,y+vsp,teto))
{
	if (!place_meeting(x,y+sign(vsp),chao) && (!place_meeting(x,y+sign(vsp),parede)) && (!place_meeting(x,y+sign(vsp),teto))) 
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y +vsp;




// movimento de imagens
if (!place_meeting(x,y+1,chao))
{
	sprite_index = sPlayer_sq;
	image_speed = 0;
	
} else 
{
	if (key_direita) || (key_esquerda)
	{
		sprite_index = sPlayer_andar_d;
		image_speed  = 1;
	} else image_speed = 0;
	sprite_index = sPlayer_andar_d;
}

if (hsp != 0) then image_xscale = sign(hsp);
	
	
