#region Comandos
var key_esquerda = keyboard_check(vk_left);
var key_direita  = keyboard_check(vk_right); // dá valor de 1 ou 0 quando presionado
var key_cima     = keyboard_check(vk_up);
var key_baixo    = keyboard_check(vk_down);
var key_salto    = keyboard_check(vk_space);
var key_tiro     = keyboard_check_pressed(ord("X"));
#endregion

#region Movimentos
var move = key_direita - key_esquerda; // para quando precionamos ambas as teclas sair movimento fluido

// velocidades
hsp = move  * walksp;
vsp = vsp + grv;

// Salto
if ((place_meeting(x,y+1,toca_chao) || (place_meeting(x,y+1,ex_solo1)))  && (key_salto)) // 8 é o ponto minimo a adicionar para detetar teto a um bloco em cima
{
	vsp = salto; 
}


// colisao parede horizontal
if (place_meeting(x+hsp,y,toca_parede) || place_meeting(x+hsp,y,toca_chao) || place_meeting(x+hsp,y,toca_teto) || place_meeting(x+hsp,y,ex_solo1))
{
	while (!place_meeting(x+sign(hsp),y,toca_parede) && (!place_meeting(x+sign(hsp),y,toca_chao)) && (!place_meeting(x+sign(hsp),y,toca_teto)) && (!place_meeting(x+sign(hsp),y,ex_solo1))) // sign é mais um ou menos um dependendo do sinal
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

x = x +hsp;


// colisão chão/teto -- Gravidade
if (place_meeting(x,y+vsp,toca_chao) || place_meeting(x,y+vsp,toca_parede) || place_meeting(x,y+vsp,toca_teto) || place_meeting(x,y+vsp,ex_solo1))
{
	if (!place_meeting(x,y+sign(vsp),toca_chao) && (!place_meeting(x,y+sign(vsp),toca_parede)) && (!place_meeting(x,y+sign(vsp),toca_teto)) && (!place_meeting(x,y+sign(vsp),ex_solo1))) 
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y +vsp;
#endregion

#region Tiros
var dirTiro = direction;
var gun_x   = (x+4)*dirTiro;
var _xx     = x + lengthdir_x(15,image_angle); // serve para fazer tiros 

if place_meeting(x,y,arma)
{
	armado = true;
	global.n_municao = global.n_municao + 5;
}

if (global.n_municao == 0)
{
	armado = false;
}

if (armado == true) && key_tiro
{
	with ( instance_create_layer(_xx,y-25,"items", municao))
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
if (!place_meeting(x,y+1,toca_chao) && !place_meeting(x,y+1,ex_solo1))
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

if (global.n_municao > 0)
{
	sprite_index = sPlayer_tiro;
	if (key_direita) || (key_esquerda) then image_speed  = 1 else image_speed  = 0;
}

#endregion
	
