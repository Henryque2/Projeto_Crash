//velocidade vertical
velv = 0
//velocidade horizontal
velh = 0
//velocidade
vel = 2
//gravidade
grav = 0.3
//velocidade do pulo
vel_jump = 6.5

//impossibilita que eu perca quantidades cavalares de vida
posso_perder_vida = true

//reinicia a fase depois de um tempo
tempo_reinicia = room_speed * 3
timer_reinicia = tempo_reinicia

//verifica se eu tô tomando dano
dano = false

//timer de dano
tempo_dano = room_speed * .5
timer_dano = 0

//invencibilidade após tomar dano
inv_tempo = room_speed * 2
inv_timer = 0

//evita repetir a musica
tocou = false

//avisa que pode mudar de fase
fim_fase = false

//state machine
if room != rm_hub 
{
	estado = "out" //normal, in, porta_in, out, porta_out, fim_fase_in, dead, pit_dead
	sprite_index = spr_crash_teleport_out
	image_speed = 0
	tocou = false
}
else
{
	estado = "porta_out"
	sprite_index = spr_crash_out
	image_speed = 0
	tocou = false
}

//crio a minha transição de sainda
layer_sequence_create("transicao", x, y, sq_transicao_out)

estado_normal = function()
{
	fim_fase = false
	tocou = false
	image_speed = 1
	
	//impedindo vários pulos no ar
	var _chao = place_meeting(x, y + 1, obj_colisor)
	
	//declarando comandos
var _left, _right, _jump, _spin

	_left = keyboard_check(vk_left) or gamepad_axis_value(global.gamepad_id, gp_axislh) < -axis_deadzone or gamepad_button_check(global.gamepad_id, gp_padl)
	_right = keyboard_check(vk_right) or gamepad_axis_value(global.gamepad_id, gp_axislh) > axis_deadzone or gamepad_button_check(global.gamepad_id, gp_padr)
	_jump = keyboard_check_pressed(ord("Z")) or gamepad_button_check_pressed(global.gamepad_id, gp_face1)
	_spin = keyboard_check_pressed(ord("X")) or  gamepad_button_check_pressed(global.gamepad_id,gp_face3) //não usado ainda	

//só posso mew controlar se o timer de dano está zerado
if timer_dano <= 0
{
	//movimentações
	velh = (_right - _left) * vel
}

//pulando
if _chao && velv >= 0
{
	if _jump
	{
		velv = - vel_jump	
	}
	
	//se eu estou no chao e me movendo
	if velh != 0
	{
		//mudando o sprite
		sprite_index = spr_crash_walk
		//faço olhar pra direção que tô indo
		image_xscale = sign(velh)
	}
	else
	{
		sprite_index = spr_crash_idle	
	}
}
else //não estou no chão
{	
	if velv < -0.1
	{
		//mudando a sprite
		sprite_index = spr_crash_jump
	}
	else if velv > 0.1
	{
		sprite_index = spr_crash_flip
		
		//se eu tô indo pra baixo, posso cair na cabeça do inimigo
		var _inimigo = instance_place(x, y + 5, obj_inimigo_pai)
		
		//se eu cai no inimigo
		if _inimigo
		{
			dano = false
			//se o inimigo não tá morto
			if _inimigo.morto == false
			{
				//subo no ar novamente
				velv = - vel_jump
			
				//avisando pro inimigo que eu acertei que ele tá tomando dano
				_inimigo.dano = true
			}
		}
	}
	
	//aplicando gravidade
	velv += grav
	if velh != 0
	{
		image_xscale = sign(velh)	
	}
}

//mudando para a animação de dano
if dano
{
	sprite_index = spr_crash_hit
	velh = 0
	if posso_perder_vida
	{
		global.vida--
		if global.vida < 1
		{
			audio_play_sound(snd_angel_crash, 0, false)
			estado = "dead"
		}
		else
		{
			audio_play_sound(snd_tomei_dano, 0, false)
			posso_perder_vida = false
		}
		
	}
}

//se o timer do dano é maior do que zero, eu diminuo ele
if timer_dano > 0
{
	timer_dano--
}
else
{
	//acabou o timer do dano
	dano = false
	posso_perder_vida = true
}

if inv_timer > 0
{
	inv_timer--
	image_alpha = 0.5
}
else
{
	image_alpha = 1	
}

//tomando dano
var _inimigo = instance_place(x,y,obj_inimigo_pai)

if _inimigo && inv_timer <= 0
{

	if _inimigo.morto == false && _inimigo.dano == false
	{
		
		dano = true	
		//dando o valor do timer dano
		timer_dano = tempo_dano
		inv_timer = inv_tempo
	}
}


//if _spin
//{
	//audio_play_sound(snd_spin, 0, false)
	//estado = "spin"	
//}

}