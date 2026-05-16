velv += grav;

x += velh;
y += velv;

image_angle += rot;

//se sair da tela ou cair demais, destrói
if (y > room_height + 64)
{
	instance_destroy();
}