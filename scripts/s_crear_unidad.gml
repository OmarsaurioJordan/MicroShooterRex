// crea a un jugador en una posicion adecuada
// arg0: ind en la lista UDP
// ret: id de instancia creada

var xx, yy, aux;
do {
    xx = random(room_width);
    yy = random(room_height);
}
until s_mizona(xx, yy);
aux = instance_create(xx, yy, o_unidad);
aux.pelo = o_udp.jugador[argument0, m_julist_pelo];
aux.genero = o_udp.jugador[argument0, m_julist_genero];
aux.grupo = o_udp.jugador[argument0, m_julist_grupo];
aux.nombre = o_udp.jugador[argument0, m_julist_nombre];
return aux;
