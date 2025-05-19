// arg0: id instancia que quiere sincronizar posiciones

with argument0 {
    if x != xi or y != yi or z != zi {
        if point_distance(x, y, xi, yi) > 128 {
            xi = x; yi = y; }
        else {
            var ddd = point_direction(xi, yi, x, y);
            var vvv = point_distance(xi, yi, x, y) * 0.1;
            xi += lengthdir_x(vvv, ddd);
            yi += lengthdir_y(vvv, ddd); }
        zi += min(z - zi, velocidad) * dt;
        depth = -(yi + zi / m_altufoza);
    }
    
    // mover camara
    if nombre == o_mundo.nombre {
        var cx = view_xview[0] + view_wview[0] * 0.5;
        var cy = view_yview[0] + view_hview[0] * 0.5 + 40;
        var ddd = point_direction(cx, cy, xi, yi);
        var vvv = point_distance(cx, cy, xi, yi) * 0.1;
        view_xview[0] += lengthdir_x(vvv, ddd);
        view_yview[0] += lengthdir_y(vvv, ddd);
    }
}
