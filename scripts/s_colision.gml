// arg0: id de quien trata de colisionar

with argument0 {
    if antecolision or random(1) < 0.05 {
        antecolision = false;
        var otro = instance_place(x, y, o_solido);
        if otro == noone {
            otro = instance_place(x, y, o_movil);
            if otro != noone {
                antecolision = true;
                var ddd = point_direction(otro.x, otro.y, x, y);
                var vvv = velocidad * dt;
                var prop = s_para_peso(otro) / 
                    (s_para_peso(id) + s_para_peso(otro));
                x += lengthdir_x(vvv * prop, ddd);
                y += lengthdir_y(vvv * prop, ddd);
                // afectar al otro
                otro.antecolision = true;
                otro.x += lengthdir_x(vvv * (1 - prop), -ddd);
                otro.y += lengthdir_y(vvv * (1 - prop), -ddd);
            }
        }
        else {
            antecolision = true;
            var ddd = point_direction(otro.x, otro.y, x, y);
            var vvv = velocidad * dt;
            x += lengthdir_x(vvv, ddd);
            y += lengthdir_y(vvv, ddd);
        }
    }
}
