// arg0: objeto a buscar
// arg1: ind web del objeto
// arg2: true creara el objeto si no existe

var aux = noone;
with argument0 {
    if idweb == argument1 {
        aux = id;
        break;
    }
}
if aux == noone and argument2 {
    aux = instance_create(0, 0, argument0);
    aux.idweb = argument1;
}
return aux;
