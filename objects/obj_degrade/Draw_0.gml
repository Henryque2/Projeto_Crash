//define a area do degrade para a area do viewport
var camera_x = camera_get_view_x(view_camera[0])
var camera_y = camera_get_view_y(view_camera[0])
var camera_width = camera_get_view_width(view_camera[0])
var camera_height = camera_get_view_height(view_camera[0])

//faz o degrade ficar maior que o viewport
var buffer_ = 60

//faz o background mudar de cor
hue += 0.2
//reseta pra zero quando chega no final
if hue > 255 hue = 0

//faz o degardê ficar colorido
cor1 = make_colour_hsv(hue,120,120)

//desenha na tela
draw_rectangle_colour(camera_x - buffer_, camera_y - buffer_, camera_x + camera_width + buffer_, camera_y + camera_height, cor1, cor1, cor2, cor2, 0) 