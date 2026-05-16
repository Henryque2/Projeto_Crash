//pausa o jogo
if global.pause
{
	image_speed = 0	
	exit
}
image_speed = 1

if morto
{
	//o que fazer quando eu morrer? morrer ué
	sprite_index = spr_bolota_morte
	
	//sumindo se acabou a minha animação
	if image_index >= image_number - 1
	{
		image_alpha -= 0.02	
	}
	//se eu sumi totalmente, eu me destruo
	if image_alpha <= 0 
	{
		instance_destroy()
	}
	exit
}

//checando se está no chao
var _chao = place_meeting(x, y + 1, obj_colisor_chao)

if _chao
{
	//vou diminuir o tempo de decidir andar
	tempo_decidir_andar -= 1
	
	//se o tempo acabou, decido se vou decidir andar
	if tempo_decidir_andar <= 0
	{
		andando = choose(true,false)
		
		//escolhendo a direção se ele decidir andar
		if andando
		{
		velh = choose(-vel,vel)
		}
		else
		{
			velh = 0
		}
		//resetando o tempo
		tempo_decidir_andar = room_speed * 2
	}

	//animação do inimigo
	if velh != 0 && dano == false
	{
		sprite_index = spr_bolota_walk
		image_xscale = sign(velh)
	}
	else
	{
		sprite_index = spr_bolota_iddle
	}
	
	//se eu bater na parede, mudo de direção
	if place_meeting(x + velh, y, obj_colisor_chao)
	{
		velh *= -1
	}
	
	//se eu não puder cair, só mudo de direção antes de cair
	if pode_cair == false
	{
		if place_meeting(x + (velh * 10), y + 1, obj_colisor_chao) == false
		{
			//se eu não posso cair e não tô tocando no chão na minha frente, eu mudo de direção
			velh *= -1
		}
	}
}
else
{
	//se não estiver no chao, aplico a gravidade
	velv += grav
	
	//velh = 0
	
	if velh != 0
	{
		image_xscale = sign(velh)	
	}
}

//checando se eu estou tomando dano 
if dano && morto == false
{
	sprite_index = spr_bolota_dano
	
	velh = 0
}
