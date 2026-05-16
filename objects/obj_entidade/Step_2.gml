//pausa o jogo
if global.pause
{
	image_speed = 0	
	exit
}
//colisão

//fazendo a colisão horizontal
//checando se tô colidindo
var _col = instance_place(x + velh, y, obj_colisor)

//se eu colidir:
if _col
{
	//checando se eu tô indo pra direita
	if velh > 0
	{
		//grudando na parede no lado direito(colisão pixel perfect)
		x = _col.bbox_left + (x - bbox_right)
	}
		
	//cheacando se eu tô indo pra esquerda
	if velh < 0
	{
		//grudando na parede no lado esquerdo(colisão pixel perfect)
		x = _col.bbox_right + (x - bbox_left)
	}
	//independente se eu colidi, eu paro
	velh = 0
	
	
}

//fazendo se mexer
x += velh

//colisão vertical
var _col = instance_place(x, y + velv, obj_colisor)

chao = false;
//se eu colidir
if _col
{
	//checando se eu tô indo pra baixo
	if velv > 0
	{
		//indo pra baixo(colisão pixel perfect)
		y = _col.bbox_top + (y - bbox_bottom)
	}
	
	//checando se eu tô indo pra cima
	if velv < 0
	{
		//indo pra cima(colisão pixel perfect)
		y = _col.bbox_bottom + (y - bbox_top)
	}
	//independente se eu colidi, eu paro
	velv = 0
	
}

//gravidade
y += velv