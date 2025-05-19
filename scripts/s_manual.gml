// arg0: id instancia que sera manejada por teclas

with argument0 {
    var n = s_ind_jugador(nombre);
    // caminar
    var vertical = o_udp.jugador[n, m_julist_move];
    var horizontal = vertical;
    if vertical == 2 or vertical == 3 or vertical == 4 {
        vertical = -100; }
    else if vertical == 1 or vertical == 5 or vertical == 0 {
        vertical = 0;}
    else {
        vertical = 100; }
    if horizontal == 4 or horizontal == 5 or horizontal == 6 {
        horizontal = -100; }
    else if horizontal == 3 or horizontal == 7 or horizontal == 0 {
        horizontal = 0;}
    else {
        horizontal = 100; }
    if vertical != 0 or horizontal != 0 {
        s_mover(id, x + horizontal, y + vertical, false);
    }
    // foco sigue al mouse
    var pdir = o_udp.jugador[n, m_julist_foco];
    var ddir = angle_difference(foco, pdir);
    foco -= min(abs(ddir), 220 * dt) * sign(ddir);
    // volar
    if o_udp.jugador[n, m_julist_vuelo] == 1 {
        enaire = min(1, enaire + 2 * dt); }
    else {
        enaire = max(0, enaire - 2 * dt); }
    // disparar
    if o_udp.jugador[n, m_julist_mousei] == 1 {
        switch estarma {
        case m_estarma_lanza:
            o_udp.jugador[n, m_julist_mousei] = 0;
            break;
        case m_estarma_espada:
            if espada != 0 and reloj_cadencia == 0 {
                reloj_cadencia = 0.25;
                var aux = instance_create(x, y, o_espada);
                aux.direction = point_direction(x, y, o_camara.x, o_camara.y);
                aux.grupo = grupo;
                aux.origen = s_ind_jugador(nombre);
                aux.oriori = id;
                aux.espada = espada;
                aux.mx = round(x + lengthdir_x(1000, direction));
                aux.my = round(y + lengthdir_y(1000, direction));
                s_udp_evento(m_udp_espada, x, y, 3,
                    aux.idweb, round(x), round(y), aux.mx, aux.my, grupo, 1,
                    clamp(floor(espada * 4), 0, 3));
                estarma = m_estarma_lanza;
            }
            break;
        case m_estarma_arma:
            if municion != 0 and reloj_cadencia == 0 {
                municion = max(0, municion - 0.01);
                reloj_cadencia = 0.25;
                var aux = instance_create(x, y, o_bala);
                aux.direction = foco + random_range(-10, 10);
                aux.grupo = grupo;
                aux.origen = s_ind_jugador(nombre);
                s_udp_evento(m_udp_creabala, x, y, 2,
                    round(x), round(y), round(aux.direction), grupo, aux.idweb,
                    -1, -1, -1);
            }
            break;
        }
    }
    // cambiar de arma
    if o_udp.jugador[n, m_julist_moused] == 1 {
        o_udp.jugador[n, m_julist_moused] = 0;
        switch estarma {
        case m_estarma_espada:
            estarma = m_estarma_arma;
            break;
        case m_estarma_arma:
            estarma = m_estarma_espada;
            break;
        case m_estarma_lanza:
            var nnn = id;
            with o_espada {
                if oriori == nnn {
                    reloj_fin = 0;
                    break;
                }
            }
            break;
        }
    }
}
