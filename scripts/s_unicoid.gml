// arg0: id de instancia que quiere obtener ind unico

argument0.idweb = -1;
var n = irandom(65535);
var ok;
do {
    ok = true;
    with argument0.object_index {
        if idweb == n {
            n = irandom(65535);
            ok = false;
            break;
        }
    }
}
until ok;
argument0.idweb = n;
