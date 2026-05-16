//pausa o jogo
if global.pause
{
	image_speed = 0	
	exit
}

//se já existe transição, não roda lógica
if global.transicao != false 
{
	image_speed = 0
	exit
}


switch (estado)
{
	case "idle":
	mudando_sprite(spr_plataforma_fim_fase)
	image_speed = 1
	
	//procura player
	var _ply = instance_place(x, bbox_top - 1, obj_crash)
		global.fase_in = rm_hub

	if (_ply != noone)
	{
		var _foot_x = _ply.bbox_left + (_ply.bbox_right - _ply.bbox_left) * 0.5
		var _foot_y = _ply.bbox_bottom + 1

		if (position_meeting(_foot_x, _foot_y, id))
		{
			if (_ply.velv >= 0 && _ply.bbox_bottom <= bbox_top + 4)
			{
				var _centro = (bbox_left + bbox_right) * 0.5
				var _zona   = (bbox_right - bbox_left) * 0.30

				if (_foot_x > _centro - _zona && _foot_x < _centro + _zona)
				{
					//salva referência do player
					alvo = _ply
					
					//muda estado do player
					alvo.estado = "fim_fase_in"

					estado = "esperando_player"
				}
			}
		}
	}
	break



	case "esperando_player":
	if (instance_exists(alvo))
	{
		if alvo.fim_fase
		{
			estado = "teleport"
		}
	}
	else
	{
		estado = "idle"
	}

	break


	case "teleport":
	mudando_sprite(spr_plataforma_fim_fase)
	var _img_vel = sprite_get_speed(sprite_index) / room_speed
	
	if image_index >= image_number - _img_vel
	{
		image_speed = 0
		
		global.transicao = true
		layer_sequence_create("transicao", obj_crash.x, obj_crash.y, sq_transicao_in)
	}
	break


	case "fechando":


	var _img_vel = sprite_get_speed(sprite_index) / room_speed

	if image_index >= image_number - _img_vel
	{
		estado = "idle"
		tocou = false
		alvo = noone
	}
	break
}
