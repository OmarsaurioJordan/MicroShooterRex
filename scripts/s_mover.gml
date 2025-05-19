// arg0: id de instancia que mueve
// arg1: punto x
// arg2: punto y
// arg3: true detectar fin
// ret: true si detecta fin y ha llegado

var res = false;
with argument0 {
    if x < argument1 - 12 or x > argument1 + 12 or 
            y < argument2 - 12 or y > argument2 + 12 {
        var ddd = point_direction(x, y, argument1, argument2);
        var vvv = velocidad * (masa / s_para_peso(id)) * dt;
        x += lengthdir_x(vvv, ddd);
        y += lengthdir_y(vvv, ddd);
        antecolision = true;
        if argument3 {
            if point_distance(x, y, argument1, argument2) < 12 {
                res = true;
            }
        }
    }
}
return res;
