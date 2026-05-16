menu_x = 25
menu_y = 540
button_h = 64

// botões
button[0] = "Continuar"
if room != rm_hub
{
button[1] = "Opções"
button[2] = "Voltar à seleção de fase"
button[3] = "Sair para o titulo"
}
else if room == rm_hub
{
button[1] = "Opções"
button[2] = "Sair para o titulo"
}
buttons = array_length(button)

menu_index = 0
last_selected = 0

reset_save = 0