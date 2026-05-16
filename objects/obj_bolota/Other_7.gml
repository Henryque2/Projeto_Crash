 //se eu estou usando a sprite de dano e a animação acabou, ele morre
if sprite_index == spr_bolota_dano
{
	audio_play_sound(snd_acerto_inimigo, 0, false)
	morto = true
}
//exemplo de como morrer com animação
if sprite_index == spr_bolota_morte
{
	image_speed = 0
	image_index = 1
}