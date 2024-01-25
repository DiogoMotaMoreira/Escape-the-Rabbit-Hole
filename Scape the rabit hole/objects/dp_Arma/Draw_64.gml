if (global.pistola == true)
{
	draw_sprite(sArma_dp,0,1150,100);

	var x1 = global.n_municao%10
	var x2 = (global.n_municao div 10)%10

	if x1 == 0 then draw_sprite(numeros,0,1250,100);
	if x1 == 1 then draw_sprite(numeros,1,1250,100);
	if x1 == 2 then draw_sprite(numeros,2,1250,100);
	if x1 == 3 then draw_sprite(numeros,3,1250,100);
	if x1 == 4 then draw_sprite(numeros,4,1250,100);
	if x1 == 5 then draw_sprite(numeros,5,1250,100);
	if x1 == 6 then draw_sprite(numeros,6,1250,100);
	if x1 == 7 then draw_sprite(numeros,7,1250,100);
	if x1 == 8 then draw_sprite(numeros,8,1250,100);
	if x1 == 9 then draw_sprite(numeros,9,1250,100);

	if x2 == 0 then draw_sprite(numeros,0,1225,100);
	if x2 == 1 then draw_sprite(numeros,1,1225,100);
	if x2 == 2 then draw_sprite(numeros,2,1225,100);
	if x2 == 3 then draw_sprite(numeros,3,1225,100);
	if x2 == 4 then draw_sprite(numeros,4,1225,100);
	if x2 == 5 then draw_sprite(numeros,5,1225,100);
	if x2 == 6 then draw_sprite(numeros,6,1225,100);
	if x2 == 7 then draw_sprite(numeros,7,1225,100);
	if x2 == 8 then draw_sprite(numeros,8,1225,100);
	if x2 == 9 then draw_sprite(numeros,9,1225,100);
}