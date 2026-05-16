//exibindo se o jogo está pausado
if global.pause
{
	//escurecendo a tela
	draw_set_alpha(0.7)
	draw_rectangle_color(0, 0, 1366, 768, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 0)
	draw_set_alpha(1)
	
	draw_set_font(fonte_menu_grande)
	draw_set_color(c_orange)
	draw_set_halign(fa_right)

	var i = 0
	repeat(buttons) 
	{
		draw_set_halign(1)
		draw_set_valign(1)
		draw_set_font(fonte_menu_grande)
		draw_set_color(c_orange)
		draw_set_halign(fa_left)
	
		if (menu_index == i) draw_set_color(c_red)//muda a cor do menu pra vermelho
	
		draw_text(menu_x, menu_y + button_h * i, button[i])
		i++
		draw_set_color(-1)
		draw_set_halign(-1)
		draw_set_valign(-1)
		draw_set_font(-1)
	}
	
	//draw_set_color(c_black)
	//draw_set_halign(1)
	//draw_set_valign(1)
	//draw_set_font(Fonte_Menu_Grande)
	//draw_text(room_width / 2, room_height / 2, "O jogo está pausado")
	//draw_set_color(-1)
	//draw_set_halign(-1)
	//draw_set_valign(-1)
	//draw_set_font(-1)
}