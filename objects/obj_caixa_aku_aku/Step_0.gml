var _player = instance_place(x, y - 4, obj_crash);

if (_player != noone)
{
	var _foot_x = _player.x;
	var _foot_y = _player.bbox_bottom + 1;

if (position_meeting(_foot_x, _foot_y, id) && _player.velv > 0)
	{
		if global.vida < 4
		{
			audio_play_sound(snd_aku_aku, 0, false)
		}
		global.vida += 1
	}
}