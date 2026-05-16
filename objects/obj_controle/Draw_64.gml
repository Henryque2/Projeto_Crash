if room != rm_titulo
{
draw_set_color(c_orange)
draw_set_halign(1)
draw_set_valign(1)
draw_set_font(fonte_menu_media)
draw_text_transformed(x,y,string(global.wumpasquecomi),2,2,1)
draw_text_transformed(x + 1150,y + 5,string(global.lifeup),2,2,1)
draw_sprite(spr_wumpa_hud, vel, x - 60, y + 5)
draw_sprite(spr_1up_hud, 0, x + 1220, y + 5)
draw_set_color(-1)
draw_set_halign(-1)
draw_set_valign(-1)
draw_set_font(-1)
}

//draw_text(200, 20, global.vida)