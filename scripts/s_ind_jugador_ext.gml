// arg0: ip
// arg1: puerto
// ret: ind de jugador en la lista UDP

var n = -1;
with o_udp {
    for (var i = 0; i < array_height_2d(jugador); i++) {
        if jugador[i, m_julist_ip] == argument0 and jugador[i, m_julist_port] == argument1 {
            n = i;
            break;
        }
    }
}
return n;
