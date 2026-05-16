for (var i = 0; i < qtd; i++)
{
    var p = prog[i];

    // escala suave (começa grande e vai pro centro)
    var sc = lerp(2.2, 0.15, p);

    // alpha suave (nasce e morre devagar)
    var a = sin(p * pi); 

    // leve variação de cor (opcional mas fica lindo)
    var cor = merge_color(c_white, c_aqua, i/qtd);

    draw_sprite_ext(spr_anel, 0, x, y, sc, sc, rot[i], cor, a)
}