draw_set_font(fonte_menu_grande)
draw_set_color(c_orange)
draw_set_halign(fa_right)

var i = 0
repeat(buttons) 
{
	draw_set_font(fonte_menu_grande)
	draw_set_color(c_orange)
	draw_set_halign(fa_right)
	
	if (menu_index == i) draw_set_color(c_red)//muda a cor do menu pra vermelho
	
	draw_text(menu_x, menu_y + button_h * i, button[i])
	i++
}