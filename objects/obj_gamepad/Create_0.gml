global.gamepad_id = noone

gamepad_connect = function()
{
	var _gamepad_slots = gamepad_get_device_count()
	
	for (var _i = 0; _i <_gamepad_slots; _i++)
	{
		if gamepad_is_connected(_i)
		{
			global.gamepad_id =_i
			gamepad_set_axis_deadzone(global.gamepad_id, axis_deadzone)
			return true
		}
	}
	
	return false
}

//verifica se algum botão do gamepad foi pressionado
gamepad_check_any_button = function()
{
	for(var _i = gp_face1; _i <= gp_extra6; _i++)
	{
		if gamepad_button_check(global.gamepad_id, _i)
		{
			return true	
		}
	}
	
	return false
	
}

//controles do player
dup = gamepad_button_check(global.gamepad_id, gp_padu) //or gamepad_axis_value(global.gamepad_id, gp_axislv) < -axis_deadzone
ddown = gamepad_button_check(global.gamepad_id, gp_padd)	

