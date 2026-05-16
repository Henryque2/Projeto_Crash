if global.pause == false
{
	vel = image_index / 5	
}

if global.wumpasquecomi == 100
{
	global.wumpasquecomi = 0
	audio_play_sound(snd_1up, 0, false)
	if global.lifeup < 99
	{
		global.lifeup += 1
	}
	else
	{
		global.lifeup = global.lifeup
	}
}

if global.vida > 4
{
	global.vida = 4	
}

if global.vida = 4
{
	if tocou == false
	{
		audio_play_sound(snd_invencibility, 1, false)	
		tocou = true
	}
	
	if audio_is_playing(snd_invencibility) && global.pause == true
	{
		audio_pause_sound(snd_invencibility)	
	}
	else if global.pause = false
	{
		audio_resume_sound(snd_invencibility)	
	}

	obj_crash.inv_timer = 9999
	obj_crash.posso_perder_vida = false
	obj_crash.dano = false
	
	if !audio_is_playing(snd_invencibility) && tocou = true
	{
		audio_play_sound(snd_aku_aku_inv_stop, 1, false)
		global.vida = 3
		tocou = false
		obj_crash.inv_timer = room_speed * 0.5
	}
}

//if keyboard_check_released(vk_pageup) global.vida++