menu_x = x
menu_y = y
button_h = 64

// botões
button[0] = "Novo Jogo"
button[1] = "Carregar"
button[2] = "Opções"
button[3] = "Sair"
buttons = array_length(button)

menu_index = 0
last_selected =0

menu = audio_play_sound(snd_c1_main_menu, 0, 0, 1.0, undefined, 1.0)
audio_sound_loop_start(snd_c1_main_menu,47.19)
audio_sound_loop_end(snd_c1_main_menu,91.1)
audio_sound_loop(menu,1)