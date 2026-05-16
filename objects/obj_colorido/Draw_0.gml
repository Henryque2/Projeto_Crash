//define a area do degrade para a area do viewport
var camera_x = camera_get_view_x(view_camera[0])
var camera_y = camera_get_view_y(view_camera[0])
var camera_width = camera_get_view_width(view_camera[0])
var camera_height = camera_get_view_height(view_camera[0])

//faz o degrade ficar maior que o viewport
var buffer_ = 60

//faz o background mudar de cor
hue += 0.5
hue2 += 0.3
//reseta pra zero quando chega no final
if hue > 255 hue = 0
if hue2 < 0 hue2 = 256

//faz o degardê ficar colorido
cor1 = make_colour_hsv(hue,200,120)
cor2 = make_colour_hsv(hue2,200,120)

//desenha na tela
draw_rectangle_colour(camera_x - buffer_, camera_y - buffer_, camera_x + camera_width + buffer_, camera_y + camera_height, cor1, cor1, cor2, cor2, 0) 

//pausa o jogo
if global.pause
{
	image_speed = 0	
	exit
}
image_speed = 1