// Incrementa o tempo
timer += float_speed;

// Calcula a nova posição Y usando seno e ajusta a posição
y = anchor_y + (sin(timer) * float_distance);
