//var vida_2 = (sHp,2,1150,50);
//var vida_3 = (sHp,2,1200,50);

if global.hp == 3
{	
	draw_sprite(sHp,1,1150,50);
	draw_sprite(sHp,1,1200,50);
	draw_sprite(sHp,1,1250,50);
}
else if global.hp == 2
{	
	draw_sprite(sHp,0,1150,50);
	draw_sprite(sHp,1,1200,50);
	draw_sprite(sHp,1,1250,50);
}
else if global.hp == 1
{	
	draw_sprite(sHp,0,1150,50);
	draw_sprite(sHp,0,1200,50);
	draw_sprite(sHp,1,1250,50);
}
else
{	
	draw_sprite(sHp,0,1150,50);
	draw_sprite(sHp,0,1200,50);
	draw_sprite(sHp,0,1250,50);
}