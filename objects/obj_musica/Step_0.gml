if global.vida == 4 or global.pause == true
{
	audio_pause_sound(fase)
	audio_pause_sound(hub)
}
else if global.vida <= 3
{
	audio_resume_sound(fase)	
	audio_resume_sound(hub)
}