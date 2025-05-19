// envia todo el mapa por UDP
// arg0: puerto
// arg1: ip

// enviar el buffer
var buf = buffer_create(8, buffer_grow, 1);
buffer_seek(buf, buffer_seek_start, 0);
buffer_write(buf, buffer_u8, m_udp_mapa);
buffer_write(buf, buffer_u16, room_width);
buffer_write(buf, buffer_u16, room_height);
buffer_write(buf, buffer_u16, ds_grid_width(o_mundo.zona) * ds_grid_height(o_mundo.zona));
for (var w = 0; w < ds_grid_width(o_mundo.zona); w++) {
    for (var h = 0; h < ds_grid_height(o_mundo.zona); h++) {
        buffer_write(buf, buffer_u8, ds_grid_get(o_mundo.zona, w, h)); } }
network_send_udp(o_udp.conexion, argument1, argument0, buf, buffer_tell(buf));
buffer_delete(buf);
