if (quebrou) exit;

var _player = instance_place(x, y - 4, obj_crash);

if (_player != noone)
{
	var _foot_x = _player.x;
	var _foot_y = _player.bbox_bottom + 1;

	if (position_meeting(_foot_x, _foot_y, id) && _player.velv > 0)
	{
		quebrou = true;

		_player.velv = -_player.vel_jump;

		for (var i = 0; i < 4; i++)
		{
			var p = instance_create_layer(x, y, "efeitos", obj_caixa_quebra);
			p.image_index = i;
		}

		audio_play_sound(snd_caixa_break, 0, false);
		instance_destroy();
	}
}