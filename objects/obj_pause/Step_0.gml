if global.transicao == true exit


pause_button = keyboard_check_released(vk_escape) or gamepad_button_check_released(global.gamepad_id, gp_start) 
//se eu apertar o botão, ele pausa
if pause_button global.pause = !global.pause 

if global.pause == 0 exit

_menuD = keyboard_check_pressed(vk_down) or gamepad_button_check_pressed(global.gamepad_id, gp_padd) //or (gamepad_axis_value(global.gamepad_id, gp_axislv) > axis_deadzone)
_menuU = keyboard_check_pressed(vk_up) or gamepad_button_check_pressed(global.gamepad_id, gp_padu) //or (gamepad_axis_value(global.gamepad_id, gp_axislv) < -axis_deadzone)
_menuS = keyboard_check_released(vk_enter) or gamepad_button_check_released(global.gamepad_id, gp_face1)

menu_move = _menuD - _menuU

menu_index += menu_move
if (menu_index < 0) menu_index = buttons -1
if (menu_index > buttons -1) menu_index = 0

if (menu_index != last_selected) audio_play_sound(snd_wumpa_collect, 1, false)


last_selected = menu_index

if _menuS
{
	if room != rm_hub 
	{	
		switch menu_index
		{
				case 0://continuar
					global.pause = 0
					break
				case 1: //opções
					show_message("não fiz ainda")
					break
				case 2: //voltar para o hub
					global.pause = 0
					global.fase_in = rm_hub
					global.transicao = true
					layer_sequence_create("transicao", obj_crash.x, obj_crash.y, sq_transicao_in)
					if audio_is_playing(snd_invencibility)
					{
						audio_stop_sound(snd_invencibility)	
					}
					break
				case 3://volta pro titulo
					room_goto(rm_titulo)
					global.pause = 0
					global.transicao = true
					global.wumpasquecomi = 0
					global.vida = global.max_vida
					instance_destroy(obj_controle)
					audio_stop_all()
					break
			}
		}	
		if room == rm_hub
		{	
			switch menu_index
				{
				case 0://continuar
					global.pause = 0
					break			
				case 1: //opções
					show_message("não configurei ainda")
					break
				case 2://volta pro titulo
					room_goto(rm_titulo)
					global.pause = 0
					global.transicao = true
					global.wumpasquecomi = 0
					global.vida = global.max_vida
					global.lifeup = global.init_lifeup
					instance_destroy(obj_controle)
					audio_stop_all()
					break
				}
		}	
}