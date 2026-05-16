qtd = 3;          // quantidade de anéis
tempo = 0;        // tempo global
vel = 0.01;       // velocidade indo pro centro
rot_spd = 1.5;    // velocidade rotação

for (var i = 0; i < qtd; i++)
{
    prog[i] = i / qtd;   // cada anel começa em um ponto do ciclo
    rot[i] = irandom(360);
}

raio_portal = 40; // distância que começa puxar o player