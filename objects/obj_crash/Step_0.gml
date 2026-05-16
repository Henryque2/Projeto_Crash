//pausa o jogo
if global.pause
{
	image_speed = 0	
	audio_pause_sound(obj_musica.fase)
	if room == rm_hub
	{
		audio_pause_sound(obj_musica.hub) 
	}
	exit
}
audio_resume_sound(obj_musica.fase)
if room == rm_hub
{
	audio_resume_sound(obj_musica.hub)
}

if abs(velv) < 0.1 velv = 0;

//impedindo vários pulos no ar
var _chao = place_meeting(x, y + 1, obj_colisor)


//se já existe transição, não roda lógica
if global.transicao != false exit

switch estado
{
	case "normal":
		estado_normal()
	break
	case "porta_in":
		mudando_sprite(spr_crash_in)

		velh = 0
		
		//terminou a animação, para ela
		var _img_vel = sprite_get_speed(sprite_index) / room_speed
		
		//indo para o estado normal
		if image_index >= image_number - _img_vel
		{
			image_speed = 0
			image_index = image_number - 1
			image_alpha = 0
		}
	break
	
	case "porta_out":
		if global.transicao != false exit
		mudando_sprite(spr_crash_out)

		velh = 0
		var _img_vel = sprite_get_speed(sprite_index) / room_speed
		
		//indo para o estado normal
		if image_index >= image_number - _img_vel
		{
			estado = "normal"	
		}
	break
	
	case "in":
	mudando_sprite(spr_crash_shrink)

	velh = 0
	
	//image_angle += 10
	
	//terminou a animação, para ela
	var _img_vel = sprite_get_speed(sprite_index) / room_speed
		
	//indo para o estado normal
	if image_index >= image_number - _img_vel
	{
		image_speed = 0
		image_index = image_number - 1
		image_alpha = 0
		image_angle = 0
		
	}
	break
	
	case "out":
		if global.transicao != false exit
		mudando_sprite(spr_crash_teleport_out)

		velh = 0
		var _img_vel = sprite_get_speed(sprite_index) / room_speed
		
		if !tocou
		{
			audio_play_sound(snd_portal_out, 1, false)
			tocou = true
		}
		
		//indo para o estado normal
		if image_index >= image_number - _img_vel
		{
			image_speed = 0
			estado = "normal"	
		}
	break
	
		case "fim_fase_in":
	mudando_sprite(spr_crash_teleport_in)
	if image_alpha < 1
	{
		image_alpha += 0.01	
	}
	
	velh = 0
	
	if audio_is_playing(snd_invencibility)
	{
		audio_stop_sound(snd_invencibility)	
	}
	
	if !tocou
	{
		audio_play_sound(snd_portal_in, 1, false)
		tocou = true
	}	
	
	//image_angle += 10
	
	//terminou a animação, para ela
	var _img_vel = sprite_get_speed(sprite_index) / room_speed
		
	//indo para o estado normal
	if image_index >= image_number - _img_vel
	{
	image_speed = 0
	image_index = image_number - 1
	image_angle = 0
	image_alpha = 0
	//visible = false
	
	fim_fase = true
	}
	break
	case "dead":
		mudando_sprite(spr_crash_angel_death)
		image_alpha = 0.5
		velv = 0
		
		timer_reinicia--
		
		if timer_reinicia = 0
		{
			if global.lifeup > 0
			{
			room_restart()
			global.vida = global.max_vida
			global.lifeup--
			}
			else
			{
				global.fase_in = rm_hub
				global.lifeup = global.init_lifeup
				global.transicao = true
				layer_sequence_create("transicao", obj_crash.x, obj_crash.y, sq_transicao_in)	
			}
		}
		
		y --
		
	break
	case "pit_dead":
		mudando_sprite(spr_crash_jump)
		image_alpha = 0.5
		velh = 0
		
		
		if !tocou
		{
			audio_play_sound(snd_pit_death, 1, false)
			tocou = true
		}
		
		timer_reinicia--
		
		if timer_reinicia = 0
		{
			if global.lifeup > 0
			{
			room_restart()
			global.vida = global.max_vida
			global.lifeup--
				if audio_is_playing(snd_invencibility)
				{
					audio_stop_sound(snd_invencibility)	
				}
			}
			else
			{
				global.fase_in = rm_hub
				global.lifeup = global.init_lifeup
				global.transicao = true
				layer_sequence_create("transicao", obj_crash.x, obj_crash.y, sq_transicao_in)	
			}
		}
		
		y --
		
	break
	//case "spin":
		//mudando_sprite(spr_crash_spin)
		
		//var _img_vel = sprite_get_speed(sprite_index) / room_speed
		
		//indo para o estado normal
		//if image_index >= image_number - _img_vel
		//{
			//estado = "normal"	
		//}
	//break
}