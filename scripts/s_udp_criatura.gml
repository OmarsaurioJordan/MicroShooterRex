// enviar la actualizacion a todos
// arg0: objeto de la criatura a enviar

var ww = view_wview[0] * 0.666;
var hh = view_hview[0] * 0.666;
with o_unidad {
    if nombre != o_mundo.nombre {
        var miid = id;
        var lista;
        var n = 0;
        with argument0 {
            if x > miid.x - ww and x < miid.x + ww and
                    y > miid.y - hh and y < miid.y + hh {
                lista[n] = id;
                n++;
            }
        }
        if n != 0 {
            // crear el buffer
            var buf = buffer_create(3, buffer_grow, 1);
            buffer_seek(buf, buffer_seek_start, 0);
            switch argument0 {
                case o_zombie: buffer_write(buf, buffer_u8, m_udp_zombie); break;
                case o_campesino: buffer_write(buf, buffer_u8, m_udp_campesino); break;
            }
            buffer_write(buf, buffer_u16, n);
            for (var i = 0; i < n; i++) {
                buffer_write(buf, buffer_u16, lista[i].idweb);
                buffer_write(buf, buffer_u8, lista[i].genero);
                buffer_write(buf, buffer_u16, round(lista[i].x));
                buffer_write(buf, buffer_u16, round(lista[i].y));
            }
            // enviar el buffer
            n = s_ind_jugador(nombre);
            if n != -1 {
                network_send_udp(o_udp.conexion, o_udp.jugador[n, m_julist_ip],
                    o_udp.jugador[n, m_julist_port], buf, buffer_tell(buf));
            }
            buffer_delete(buf);
        }
    }
}
