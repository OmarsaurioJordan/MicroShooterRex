// arg0: nombre de jugador
// ret: ind de jugador en la lista UDP

var n = -1;
with o_udp {
    for (var i = 0; i < array_height_2d(jugador); i++) {
        if jugador[i, m_julist_nombre] == argument0 {
            n = i;
            break;
        }
    }
}
return n;
