var _crash = obj_crash;
var _lado  = sign(_crash.image_xscale);

var _offx = 20 * _lado;
var _offy = -20;

float_timer += 0.15;
var _float = sin(float_timer * 0.5) * 1.5;

if global.vida = 2
	{
		draw_sprite_ext(spr_aku_aku_normal, image_index, _crash.x - _offx, _crash.y + _offy + _float, _lado, 1, 0, c_white, 1)	
	}
	else if global.vida = 3
	{
		draw_sprite_ext(spr_aku_aku_gold, image_index, _crash.x - _offx, _crash.y + _offy + _float, _lado, 1, 0, c_white, 1)	
	}
	else if global.vida = 4
	{
		draw_sprite_ext(spr_aku_aku_invencible, vel, obj_crash.x + (5 * _lado), obj_crash.y - 5, _lado, 1, 0, c_white, 1)
	}