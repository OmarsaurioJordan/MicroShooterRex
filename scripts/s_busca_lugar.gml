// arg0: posicion x
// arg1: posicion y
// arg2: objeto con el cual detectar colision, o noone
// arg3: true si debe verificar movimiento por tierra
// arg4: alcance visual limite maximo
// arg5: limite minimo de alcance visual
// ret: array con par de puntos, o mismos iniciales si fallo

var res, xx, yy, dd;
res[0] = argument0;
res[1] = argument1;
repeat 4 {
    do {
        xx = argument0 + random_range(-argument4, argument4);
        yy = argument1 + random_range(-argument4, argument4);
        dd = point_distance(argument0, argument1, xx, yy);
    }
    until dd < argument4 and dd > argument5;
    if s_mizona(xx, yy) {
        if argument3 {
            if s_verifica_linea(argument0, argument1, xx, yy, argument2) {
                res[0] = xx;
                res[1] = yy;
                break;
            }
        }
        else {
            if argument2 != noone {
                if collision_line(argument0, argument1, xx, yy, argument2, true, true) {
                    continue;
                }
            }
            if s_mizona(xx, yy) {
                res[0] = xx;
                res[1] = yy;
                break;
            }
        }
    }
}
return res;
