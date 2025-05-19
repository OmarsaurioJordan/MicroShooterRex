// arg0: ind de comando UDP
// arg1: posicion x del suceso
// arg2: posicion y del suceso
// arg3: distancia extra de enventanado
// arg4: numero enteo que sirve de parametro extra
// arg5: numero enteo que sirve de parametro extra
// arg6: numero enteo que sirve de parametro extra
// arg7: numero enteo que sirve de parametro extra
// arg8: numero enteo que sirve de parametro extra
// arg9: numero enteo que sirve de parametro extra
// arg10: numero enteo que sirve de parametro extra
// arg11: numero enteo que sirve de parametro extra

if servidor {
    var ww = view_wview[0] * 0.666 * argument3;
    var hh = view_hview[0] * 0.666 * argument3;
    var aux;
    var arr;
    arr[0] = argument4;
    arr[1] = argument5;
    arr[2] = argument6;
    arr[3] = argument7;
    arr[4] = argument8;
    arr[5] = argument9;
    arr[6] = argument10;
    arr[7] = argument11;
    var buf = buffer_create(3, buffer_grow, 1);
    buffer_seek(buf, buffer_seek_start, 0);
    buffer_write(buf, buffer_u8, argument0);
    for (var i = 0; i < 8; i++) {
        if arr[i] != -1 {
            buffer_write(buf, buffer_u16, arr[i]);
        }
    }
    var sss = buffer_tell(buf);
    for (var i = 0; i < array_height_2d(o_udp.jugador); i++) {
        if o_udp.jugador[i, m_julist_nombre] != o_mundo.nombre {
            aux = noone;
            with o_unidad {
                if nombre == o_udp.jugador[i, m_julist_nombre] {
                    aux = id;
                    break;
                }
            }
            if aux != noone {
                if argument1 > aux.x - ww and argument1 < aux.x + ww and
                        argument2 > aux.y - hh and argument2 < aux.y + hh {
                    network_send_udp(o_udp.conexion, o_udp.jugador[i, m_julist_ip],
                        o_udp.jugador[i, m_julist_port], buf, sss);
                }
            }
        }
    }
    buffer_delete(buf);
}
