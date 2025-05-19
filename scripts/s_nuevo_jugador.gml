// agrega un nuevo jugador a la lista
// arg0: nombre
// arg1: grupo
// arg2: genero
// arg3: pelo
// arg4: port
// arg5: ip
// ret: true si todo sale bien, false si ya estaba registrado el ip-port

var res = true;
with o_udp {
    var n = 0;
    if is_array(jugador) { n = array_height_2d(jugador); }
    var mnn = s_ind_jugador(argument0);
    var mip = s_ind_jugador_ext(argument5, argument4);
    var ab, cd;
    if mnn != -1 { ab = jugador[mnn, m_julist_sleep] == 0; }
    else { ab = true; }
    if mip != -1 { cd = jugador[mip, m_julist_sleep] == 0; }
    else { cd = true; }
    res = ab and cd;
    if res {
        jugador[n, m_julist_sleep] = 5; // segundos que dormira si no hay accion UDP, s
        jugador[n, m_julist_vuelo] = 0; // pulsado boton de vuelo, bin
        jugador[n, m_julist_build] = 0; // que tecla de construccion se pulso, ind
        jugador[n, m_julist_expres] = 0; // que tecla de expresion se pulso, ind
        jugador[n, m_julist_espacio] = 0; // pulsada tecla espacio, golpe mele
        jugador[n, m_julist_moused] = 0; // pulsado boton derecho mouse, bin
        jugador[n, m_julist_mousei] = 0; // pulsado boton izquierdo mouse, bin
        jugador[n, m_julist_foco] = irandom(360); // direccion en que apunta el mouse, int
        jugador[n, m_julist_move] = 0; // hacia donde se desea que mueva, ind 0 o 1 a 8
        jugador[n, m_julist_puntos] = 0; // puntos acumulados en juego
        jugador[n, m_julist_muertes] = 0; // cuantas veces ha muerto
        jugador[n, m_julist_port] = argument4; // puerto asociado al jugador
        jugador[n, m_julist_ip] = argument5; // ip asociada al jugador
        jugador[n, m_julist_pelo] = argument3; // pelo del personaje
        jugador[n, m_julist_genero] = argument2; // genero del personaje
        jugador[n, m_julist_grupo] = argument1; // grupo al que pertenece el personaje
        jugador[n, m_julist_nombre] = argument0; // nombre del personaje / jugador
    }
}
return res;
