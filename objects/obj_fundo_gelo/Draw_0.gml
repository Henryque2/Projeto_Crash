//define a area do degrade para a area do viewport
var camera_x = camera_get_view_x(view_camera[0])
var camera_y = camera_get_view_y(view_camera[0])
var camera_width = camera_get_view_width(view_camera[0])
var camera_height = camera_get_view_height(view_camera[0])

//faz o degrade ficar maior que o viewport
var buffer_ = 60

//faz o degardê ficar colorido
cor1 = make_colour_hsv(180,100,120)
cor2 = make_colour_hsv(0,50,150)

//desenha na tela
draw_rectangle_colour(camera_x - buffer_, camera_y - buffer_, camera_x + camera_width + buffer_, camera_y + camera_height, cor1, cor1, cor2, cor2, 0) 

//pausa o jogo
if global.pause
{
	image_speed = 0	
	exit
}
image_speed = 1