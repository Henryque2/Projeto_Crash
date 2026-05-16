// Inherit the parent event
//herda tudo do obj_entidade
event_inherited();

//personalizando variaveis
//ele vai decidir entre direita e esquerda

vel = choose(1,-1)

andando = choose(true,false)
if andando
	{
		velh = choose(-vel,vel)
	}
	else
	{
		velh = 0
	}
tempo_decidir_andar = room_speed * 2