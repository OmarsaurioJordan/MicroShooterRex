// arg0: posicion x inicial
// arg1: posicion y inicial
// arg2: posicion x final
// arg3: posicion y final
// arg4: objeto con el cual detectar colision, o noone
// ret: true si el camino esta libre

var res = true;
if argument4 != noone {
    if collision_line(argument0, argument1, argument2, argument3,
            argument4, true, true) {
        res = false;
    }
}
if res {
    var xx, yy;
    var ddd = point_direction(argument0, argument1, argument2, argument3);
    var vvv = point_distance(argument0, argument1, argument2, argument3);
    for (var i = 0; i <= ceil(vvv / m_mapa_celda) * m_mapa_celda; i += m_mapa_celda) {
        xx = argument0 + lengthdir_x(i, ddd);
        yy = argument1 + lengthdir_y(i, ddd);
        if !s_mizona(xx, yy) {
            res = false;
            break;
        }
    }
}
return res;
