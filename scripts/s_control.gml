// envia por UDP los comandos del jugador al servidor
// arg0: id del personaje o noone
// arg1: true para enviar por UDP
// ret: array con los valores de los controles

var res;
// caminar
if keyboard_check(ord('A')) {
    if keyboard_check(ord('W')) {
        res[0] = 4; }
    else if keyboard_check(ord('S')) {
        res[0] = 6; }
    else {
        res[0] = 5; }
}
else if keyboard_check(ord('D')) {
    if keyboard_check(ord('W')) {
        res[0] = 2; }
    else if keyboard_check(ord('S')) {
        res[0] = 8; }
    else {
        res[0] = 1; }
}
else {
    if keyboard_check(ord('W')) {
        res[0] = 3; }
    else if keyboard_check(ord('S')) {
        res[0] = 7; }
    else {
        res[0] = 0; }
}
// foco sigue al mouse
if argument0 != noone {
    res[1] = point_direction(argument0.xi, argument0.yi, mouse_x, mouse_y);
}
else {
    res[1] = irandom(360);
}
// disparar
res[2] = 0;
if mouse_check_button(mb_left) {
    res[2] = 1; }
// vuelo
res[3] = 0;
if keyboard_check(vk_space) {
    res[3] = 1; }

// enviar el buffer
if argument1 {
    var buf = buffer_create(6, buffer_grow, 1);
    buffer_seek(buf, buffer_seek_start, 0);
    buffer_write(buf, buffer_u8, m_udp_control);
    buffer_write(buf, buffer_u8, res[0]);
    buffer_write(buf, buffer_u16, res[1]);
    buffer_write(buf, buffer_u8, res[2]);
    buffer_write(buf, buffer_u8, res[3]);
    network_send_udp(o_udp.conexion, o_udp.sip, o_udp.sport, buf, buffer_tell(buf));
    buffer_delete(buf);
}

return res;
