#region Comandos
var key_esquerda = keyboard_check(vk_left);
var key_direita  = keyboard_check(vk_right); // dá valor de 1 ou 0 quando presionado
var key_cima     = keyboard_check(vk_up);
var key_baixo    = keyboard_check(vk_down);
var key_salto    = keyboard_check(vk_space);
var key_tiro     = keyboard_check_pressed(ord("X"));
var key_pause     = keyboard_check_pressed(ord("P"));
#endregion

// pausa
if (key_pause) then global.pause = true;

if global.pause== false
{
#region Movimentos
var move = key_direita - key_esquerda; // para quando precionamos ambas as teclas sair movimento fluido

// velocidades
hsp = move  * walksp;
if !place_meeting(x,y,escada_lb) then vsp = vsp + grv else vsp = 0;

// Salto
if ((place_meeting(x,y+1,toca_chao) || (place_meeting(x,y+1,ex_solo1)))  && (key_salto) || (place_meeting(x,y+1,chao_lb))  && (key_salto)) // 8 é o ponto minimo a adicionar para detetar teto a um bloco em cima
{
	audio_play_sound(sound_jump,0,false)
	vsp = salto; 
}


// colisao parede horizontal
if (place_meeting(x+hsp,y,toca_parede) || place_meeting(x+hsp,y,toca_chao) || place_meeting(x+hsp,y,toca_teto) || place_meeting(x+hsp,y,ex_solo1) || place_meeting(x+hsp,y,chao_lb))
{
	while (!place_meeting(x+sign(hsp),y,toca_parede) && (!place_meeting(x+sign(hsp),y,toca_chao)) && (!place_meeting(x+sign(hsp),y,toca_teto)) && (!place_meeting(x+sign(hsp),y,ex_solo1)) && (!place_meeting(x+sign(hsp),y,chao_lb))) // sign é mais um ou menos um dependendo do sinal
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}

if room == Exterior 

{
	if x + hsp <= 0
	{
		while x + sign(hsp) != 0
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}
	
	if x + hsp >= 3000
	{
		while x + sign(hsp) != 3000
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}
}

if room == Lobby 

{
	if x + hsp <= 0
	{
		while x + sign(hsp) != 0
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}
	
	if x + hsp >= 1280
	{
		while x + sign(hsp) != 1280
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}
}

x = x +hsp;


// colisão chão/teto -- Gravidade

if (place_meeting(x,y+vsp,toca_chao) || place_meeting(x,y+vsp,toca_parede) || place_meeting(x,y+vsp,toca_teto) || place_meeting(x,y+vsp,ex_solo1) || (place_meeting(x,y+vsp,chao_lb)))
{
	while (!place_meeting(x,y+sign(vsp),toca_chao) && (!place_meeting(x,y+sign(vsp),toca_parede)) && (!place_meeting(x,y+sign(vsp),toca_teto)) && (!place_meeting(x,y+sign(vsp),ex_solo1)) && (!place_meeting(x,y+sign(vsp),chao_lb))) 
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

//	Escadas
	if key_cima  && place_meeting(x,y,escada_lb) then vsp = -walksp;
	if key_baixo && (place_meeting(x,y,escada_lb) && !place_meeting(x,y+50,chao_lb) || place_meeting(x,y+50,escada_lb)) then vsp = walksp;

y = y +vsp;
#endregion

#region Tiros
var dirTiro = direction;
var gun_x   = (x+4)*dirTiro;
var _xx     = x + lengthdir_x(15,image_angle); // serve para fazer tiros 

if room == Exterior || room == Lobby
{
	global.armado = false;
}
else global.armado = true;
 
if place_meeting(x,y,arma)
{
	global.n_municao = global.n_municao + 5;
}

if (global.n_municao == 0)
{
	global.armado = false;
}

if (global.armado == true) && key_tiro
{
	audio_play_sound(sound_tiro,0,false);
	with ( instance_create_layer(_xx,y-20,"items", municao))
	{
		global.n_municao = global.n_municao -1;
		//velocidade do tiro
		speed = 20;
		// direção
		direction = -90 + 90*other.image_xscale;
		// angulo
		image_angle = direction;
	}
	
}
#endregion

#region Moedas
if place_meeting(x,y,moeda)
{
	global.n_moedas = global.n_moedas + 1;
}
#endregion

#region imagens
// movimento de imagens

if (!place_meeting(x,y+1,toca_chao) && !place_meeting(x,y+1,ex_solo1) && !place_meeting(x,y+1,chao_lb) && !place_meeting(x,y,escada_lb)) 
{
	
	if vsp <=0
	{
		sprite_index = sPlayer_sq;
		image_index = 0;
	}
	else
	{
		sprite_index = sPlayer_sq;
		image_index = 1;
	}
	
} else if !place_meeting(x,y,escada_lb)
{
	if hsp == 0 then sprite_index = sPlayer;
	
	if (key_direita) || (key_esquerda)
	{
		sprite_index = sPlayer_andar;
		image_speed  = 2;
	}
}
else
{
	if (key_cima) || (key_baixo)
	{
		sprite_index = sPlayer_escada;
		image_speed  = 1;
	}
	
	if vsp == 0 && hsp == 0 then image_speed = 0;
	
}


if (hsp != 0) then image_xscale = sign(hsp);

if (global.armado == true && global.n_municao > 0)
{
	sprite_index = sPlayer_andar_tiro;
	if (key_direita) || (key_esquerda) then image_speed  = 1 else image_speed  = 0;
}


#endregion
}