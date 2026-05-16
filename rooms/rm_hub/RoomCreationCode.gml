audio_stop_sound(obj_musica.hub)
audio_stop_sound(obj_musica.fase)
obj_musica.hub = audio_play_sound(snd_hub, 1, true)
audio_sound_loop_start(snd_hub,43)
audio_sound_loop_end(snd_hub,142.4)
audio_sound_loop(obj_musica.hub,1)
if !instance_exists(obj_controle)
{
	instance_create_layer(100, 32, "controladora", obj_controle)	
}