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
	switch menu_index
		{
				case 0://jogar
					room_goto(rm_hub)
					if _menuS
					{
						audio_play_sound(snd_woah, 0, 0, 1.0, undefined, 1.0)
						audio_stop_sound(menu)
					}
					break
				case 1://carregar
					show_message("Nem tem save ainda rapaz")
					break
				case 2://opções
					show_message("não configurei ainda")
					break
				case 3://sair
					game_end()
			}
		}	
