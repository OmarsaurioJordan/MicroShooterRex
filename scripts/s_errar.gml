// arg0: id instancia que se mueve
// arg1: indice de cambio de movimiento en s
// arg2: probabilidad de moverse con el indice de cambio
// arg3: probabilidad buscar al objeto de arg4
// arg4: objeto que sera buscado o noone
// arg5: alcance visual maximo de busqueda
// ret: true si el reloj se disparo

var res = false;
with argument0 {
    reloj_errar -= dt;
    if reloj_errar <= 0 {
        reloj_errar = argument1 * random_range(0.5, 1);
        res = true;
        // ver si ponerse en movimiento
        if random(1) < argument2 {
            var ppp;
            // va hacia algun aliado o blanco cercano
            if argument4 != noone and random(1) < argument3 {
                ppp = s_busca_social(x, y, o_solido, true, argument4, argument5, argument5 * 0.1);
            }
            // va a un lugar al azar
            else {
                // hacer busqueda lejana
                if random(1) < 0.05 {
                    ppp = s_busca_lugar(x, y, o_solido, true, argument5 * 3, argument5);
                    if ppp[0] != x {
                        reloj_errar *= 3; }
                }
                // busqueda corta
                else {
                    ppp = s_busca_lugar(x, y, o_solido, true, argument5, 0);
                }
            }
            mx = ppp[0];
            my = ppp[1];
        }
        // permanecer quieto
        else {
            mx = x;
            my = y;
        }
    }
}
return res;
