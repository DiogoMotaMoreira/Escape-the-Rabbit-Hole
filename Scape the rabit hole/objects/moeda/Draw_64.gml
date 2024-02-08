draw_sprite(sMoeda,0,50,50);

var x1 = (global.n_moedas)%10;
var x2 = (global.n_moedas div 10)%10;
var x3 = (global.n_moedas div 100)%10;
var x4 = (global.n_moedas div 1000)%10;


if x4 == 0 then draw_sprite(numeros,0,100,50);
if x4 == 1 then draw_sprite(numeros,1,100,50);
if x4 == 2 then draw_sprite(numeros,2,100,50);
if x4 == 3 then draw_sprite(numeros,3,100,50);
if x4 == 4 then draw_sprite(numeros,4,100,50);
if x4 == 5 then draw_sprite(numeros,5,100,50);
if x4 == 6 then draw_sprite(numeros,6,100,50);
if x4 == 7 then draw_sprite(numeros,7,100,50);
if x4 == 8 then draw_sprite(numeros,8,100,50);
if x4 == 9 then draw_sprite(numeros,9,100,50);

if x3 == 0 then draw_sprite(numeros,0,125,50);
if x3 == 1 then draw_sprite(numeros,1,125,50);
if x3 == 2 then draw_sprite(numeros,2,125,50);
if x3 == 3 then draw_sprite(numeros,3,125,50);
if x3 == 4 then draw_sprite(numeros,4,125,50);
if x3 == 5 then draw_sprite(numeros,5,125,50);
if x3 == 6 then draw_sprite(numeros,6,125,50);
if x3 == 7 then draw_sprite(numeros,7,125,50);
if x3 == 8 then draw_sprite(numeros,8,125,50);
if x3 == 9 then draw_sprite(numeros,9,125,50);

if x2 == 0 then draw_sprite(numeros,0,150,50);
if x2 == 1 then draw_sprite(numeros,1,150,50);
if x2 == 2 then draw_sprite(numeros,2,150,50);
if x2 == 3 then draw_sprite(numeros,3,150,50);
if x2 == 4 then draw_sprite(numeros,4,150,50);
if x2 == 5 then draw_sprite(numeros,5,150,50);
if x2 == 6 then draw_sprite(numeros,6,150,50);
if x2 == 7 then draw_sprite(numeros,7,150,50);
if x2 == 8 then draw_sprite(numeros,8,150,50);
if x2 == 9 then draw_sprite(numeros,9,150,50);

if x1 == 0 then draw_sprite(numeros,0,175,50);
if x1 == 1 then draw_sprite(numeros,1,175,50);
if x1 == 2 then draw_sprite(numeros,2,175,50);
if x1 == 3 then draw_sprite(numeros,3,175,50);
if x1 == 4 then draw_sprite(numeros,4,175,50);
if x1 == 5 then draw_sprite(numeros,5,175,50);
if x1 == 6 then draw_sprite(numeros,6,175,50);
if x1 == 7 then draw_sprite(numeros,7,175,50);
if x1 == 8 then draw_sprite(numeros,8,175,50);
if x1 == 9 then draw_sprite(numeros,9,175,50);
