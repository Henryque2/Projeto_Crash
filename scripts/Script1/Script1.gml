function Script1(){

}
randomise()

//state machine
function mudando_sprite(_sprite)
{
	image_speed = 1
	//checar se eu estou com a sprite correta
	if sprite_index != _sprite
	{
		sprite_index = _sprite
		image_index = 0
	}
}
//transição
global.transicao = true

//dano
global.max_vida = 1
global.vida = global.max_vida

//score das frutas
global.wumpasquecomi = 0

//vida
global.init_lifeup = 4
global.lifeup = global.init_lifeup

//lembra a fase que eu vou ir
global.fase_in = 0