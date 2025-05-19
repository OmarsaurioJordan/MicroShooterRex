// arg0: objeto de tipo de criatura a crear
// ret: id de instancia creada

var xx, yy, aux;
do {
    xx = random(room_width);
    yy = random(room_height);
}
until s_mizona(xx, yy);
aux = instance_create(xx, yy, argument0);
return aux;
