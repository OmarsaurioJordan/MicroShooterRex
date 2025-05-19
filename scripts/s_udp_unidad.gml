// enviar la actualizacion de la unidad a todos
// arg0: true si general, false solo nombre y estilo

var lista;
var n = 0;
with o_unidad {
    lista[n] = id;
    n++;
}
if n!= 0 {
    // crear el buffer
    var buf = buffer_create(3, buffer_grow, 1);
    buffer_seek(buf, buffer_seek_start, 0);
    if argument0 {
        buffer_write(buf, buffer_u8, m_udp_unidad); }
    else {
        buffer_write(buf, buffer_u8, m_udp_estilo); }
    buffer_write(buf, buffer_u8, n);
    for (var i = 0; i < n; i++) {
        with lista[i] {
            buffer_write(buf, buffer_u16, idweb);
            if argument0 {
                buffer_write(buf, buffer_u16, round(x));
                buffer_write(buf, buffer_u16, round(y));
                buffer_write(buf, buffer_u16, round(z));
                buffer_write(buf, buffer_u8, estarma);
                buffer_write(buf, buffer_u8, floor(enaire * 255));
                buffer_write(buf, buffer_u8, floor(vida * 255));
                buffer_write(buf, buffer_u8, floor(energia * 255));
                buffer_write(buf, buffer_u8, floor(hambre * 255));
                buffer_write(buf, buffer_u8, floor(armadura * 255));
                buffer_write(buf, buffer_u8, floor(blindaje * 255));
                buffer_write(buf, buffer_u8, floor(escudo * 255));
                buffer_write(buf, buffer_u8, floor(espada * 255));
                buffer_write(buf, buffer_u8, floor(municion * 255));
            }
            else {
                buffer_write(buf, buffer_u8, genero);
                buffer_write(buf, buffer_u8, pelo);
                buffer_write(buf, buffer_u8, grupo);
                buffer_write(buf, buffer_string, nombre);
            }
        }
    }
    // enviar el buffer
    var sss = buffer_tell(buf);
    for (var i = 0; i < array_height_2d(o_udp.jugador); i++) {
        if o_udp.jugador[i, m_julist_nombre] != o_mundo.nombre {
            network_send_udp(o_udp.conexion, o_udp.jugador[i, m_julist_ip],
                o_udp.jugador[i, m_julist_port], buf, sss);
        }
    }
    buffer_delete(buf);
}
