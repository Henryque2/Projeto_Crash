//pausa o jogo
if global.pause
{
	image_speed = 0	
	exit
}

if global.pause

tempo += vel;

for (var i = 0; i < qtd; i++)
{
    prog[i] += vel;

    // loop infinito suave
    if (prog[i] > 1) prog[i] -= 1;

    rot[i] += rot_spd;
}


//suga o player pra dentro do portal
if obj_transportador.estado == "abrindo" 
{
	if (instance_exists(obj_crash))
{
    var d = point_distance(x,y,obj_crash.x,obj_crash.y);

    if (d < raio_portal)
    {
        var dirp = point_direction(obj_crash.x,obj_crash.y,x,y);
        obj_crash.x += lengthdir_x(0.6,dirp);
        obj_crash.y += lengthdir_y(0.6,dirp);
    }
}	
}	