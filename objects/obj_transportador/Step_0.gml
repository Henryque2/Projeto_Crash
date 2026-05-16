//pausa o jogo
if global.pause
{
	image_speed = 0	
	exit
}


//se tá rolando uma transição, eu não faço nada
if global.transicao != false exit

switch estado
{
	case "idle":
		sprite_index = spr_porta
		image_speed = 1
		
		//se eu tô colidindo com o player e ele apertar pra cima, ele netra
		var _player = instance_place(x, y, obj_crash)
		if _player
		{
			global.fase_in = fase
			if keyboard_check_pressed(vk_up) or gamepad_button_check(global.gamepad_id, gp_padu)
			{
				estado = "abrindo"	
				obj_pause.reset_save = global.wumpasquecomi
				//fazendo o player ir para o estado de "in"
				_player.estado = "in"	
				audio_play_sound(snd_portal_in, 1, false)
			}
		}
	break
	
	case "abrindo":
		mudando_sprite(spr_porta_abre)
		var _img_vel = sprite_get_speed(sprite_index) / room_speed
		
		//terminou de abrir, ela fica parada
		if image_index >= image_number - _img_vel
		{
			image_speed = 0	
			
			//crio a minha transição
			global.transicao = true
			layer_sequence_create("transicao", obj_crash.x, obj_crash.y, sq_transicao_in)
		}
	break
	
	case "fechando":
		mudando_sprite(spr_porta_fecha)
		var _img_vel = sprite_get_speed(sprite_index) / room_speed
		
		//saindo do estado de fechando
		if image_index >= image_number - _img_vel
		{
			estado = "idle"	
		}
	break
}