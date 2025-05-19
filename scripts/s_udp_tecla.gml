// arg0: ind de comando UDP
// arg1: numero enteo que sirve de parametro extra

var buf = buffer_create(2, buffer_grow, 1);
buffer_seek(buf, buffer_seek_start, 0);
buffer_write(buf, buffer_u8, argument0);
buffer_write(buf, buffer_u8, argument1);
network_send_udp(o_udp.conexion, o_udp.sip, o_udp.sport, buf, buffer_tell(buf));
buffer_delete(buf);
