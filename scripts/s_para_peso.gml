// arg0: id de quien llama a preguntar por su peso en kg
// ret: el peso en kg

var res = 0;
with argument0 {
    if object_index == o_unidad {
        res = masa + escudo * 12 + blindaje * 6 + espada * 3 + municion * 1;
        if enaire >= 0.5 {
            if s_mizona(x, y) { res *= 0.5; }
            else { res *= 0.3; }
        }
    }
    else {
        res = masa; }
}
return res;
