if obj_crash.estado = "dead" or obj_crash.estado = "pit_dead" exit

effect_create_below(7, x, y, 0, $FF0C6666 & $ffffff);
audio_play_sound(snd_1up, 1, false)	
if global.lifeup < 99
{
	global.lifeup++
}
instance_destroy(self)